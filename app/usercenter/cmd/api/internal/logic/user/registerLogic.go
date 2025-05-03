package user

import (
	"context"
	"database/sql"
	"errors"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/model"
	"github.com/ai4energy/Ai4EEMS-go/pkg/ctxdata"
	"github.com/golang-jwt/jwt/v4"
	"github.com/zeromicro/go-zero/core/logx"
	"github.com/zeromicro/go-zero/core/stores/sqlc"
	"golang.org/x/crypto/bcrypt"
	"time"
)

type RegisterLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// 用户注册
func NewRegisterLogic(ctx context.Context, svcCtx *svc.ServiceContext) *RegisterLogic {
	return &RegisterLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *RegisterLogic) Register(req *types.RegisterReq) (resp *types.RegisterResp, err error) {

	// 1. 参数基础校验 (可添加更多，如手机号格式)
	if len(req.Mobile) == 0 {
		return nil, errors.New("手机号不能为空")
	}
	if len(req.Password) < 6 { // 示例：密码最小长度
		return nil, errors.New("密码长度不能少于6位")
	}

	// 2. 检查手机号是否已被注册
	mobileNullable := sql.NullString{
		String: req.Mobile,
		Valid:  true,
	}
	// 使用 l.ctx 进行数据库查询
	_, err = l.svcCtx.UsersModel.FindOneByMobile(l.ctx, mobileNullable)
	// 注意: 根据 goctl model 生成方式，错误可能是 sqlc.ErrNotFound 或 model.ErrNotFound
	if err == nil {
		// 没报错，说明找到了用户，手机号已存在
		return nil, errors.New("该手机号已被注册")
	}
	// 检查是否是 "未找到记录" 的错误，如果不是，则认为是其他数据库错误
	if !errors.Is(err, sqlc.ErrNotFound) && !errors.Is(err, model.ErrNotFound) {
		l.Errorf("数据库查询手机号失败: %v", err)
		// 对外返回通用错误信息
		return nil, errors.New("注册失败，请稍后重试 [DB Check Error]")
	}
	// 如果是 ErrNotFound，说明手机号可用，继续执行

	// 3. 密码加密
	hashedPasswordBytes, err := bcrypt.GenerateFromPassword([]byte(req.Password), bcrypt.DefaultCost)
	if err != nil {
		l.Errorf("密码加密失败: %v", err)
		return nil, errors.New("注册失败，请稍后重试 [Hash Error]")
	}
	hashedPassword := string(hashedPasswordBytes)

	// 4. 准备插入数据库的用户数据
	newUser := &model.User{
		LoginName: req.Mobile,                   // 默认使用手机号作为登录名，确保 login_name 是 NOT NULL
		RealName:  sql.NullString{Valid: false}, // 真实姓名通常注册时不填
		Password:  hashedPassword,               // 存储加密后的密码
		Mobile:    mobileNullable,               // 手机号
		Email:     sql.NullString{Valid: false}, // 邮箱通常注册时不填
		Avatar:    sql.NullString{Valid: false}, // 头像通常注册时不填
		Status:    1,                            // 默认状态设为 1 (正常/已激活), 根据业务调整
		Remark:    sql.NullString{Valid: false}, // 备注通常注册时不填
		// CreatedTime 和 UpdatedTime 由数据库 DEFAULT 或触发器处理
		DeletedTime: sql.NullTime{Valid: false}, // 删除时间为空
	}

	// 5. 插入新用户到数据库
	// 使用 l.ctx
	_, err = l.svcCtx.UsersModel.Insert(l.ctx, newUser)
	if err != nil {
		// 这里可能因为 login_name 或 email 的唯一约束冲突而失败
		l.Errorf("插入新用户记录失败: %v", err)
		return nil, errors.New("注册失败，请稍后重试 [DB Insert Error]")
	}

	// 6. 获取刚插入用户的 ID (因为 LastInsertId 对 PG SERIAL 不可靠)
	// 插入成功后，立即通过手机号查询刚创建的用户信息
	var registeredUser *model.User
	registeredUser, err = l.svcCtx.UsersModel.FindOneByMobile(l.ctx, mobileNullable)
	if err != nil {
		// 按理说，刚插入成功，这里不应该找不到或出错
		l.Errorf("获取刚注册用户信息失败: %v", err)
		// 这是一个比较严重的状态不一致，可能需要报警或特殊处理
		return nil, errors.New("注册状态异常，请联系管理员")
	}
	// 现在我们有了新用户的 ID: registeredUser.Id

	// 7. 生成 JWT Token
	now := time.Now().Unix()
	accessExpire := l.svcCtx.Config.JwtAuth.AccessExpire // 从配置加载过期时间 (秒)
	jwtSecret := l.svcCtx.Config.JwtAuth.AccessSecret    // 从配置加载 JWT 密钥
	accessToken, err := l.generateJwtToken(jwtSecret, now, accessExpire, registeredUser.Id)
	if err != nil {
		l.Errorf("生成 JWT Token 失败: userId=%d, error=%v", registeredUser.Id, err)
		return nil, errors.New("生成认证信息失败，请稍后重试")
	}

	// 8. 构造并返回响应
	resp = &types.RegisterResp{
		AccessToken:  accessToken,
		AccessExpire: now + accessExpire,   // 返回绝对过期时间戳
		RefreshAfter: now + accessExpire/2, // 返回建议刷新时间戳 (例如，过期时间的一半)
	}

	return resp, nil // 注册成功
}

// generateJwtToken 生成 JWT Token 的辅助函数
func (l *RegisterLogic) generateJwtToken(secretKey string, iat, seconds, userId int64) (string, error) {
	claims := make(jwt.MapClaims)
	claims["exp"] = iat + seconds // 过期时间
	claims["iat"] = iat           // 签发时间
	// --- 直接使用字符串 "userId" ---
	claims[ctxdata.CtxKeyJwtUserId] = userId
	// --- 结束修改 ---

	token := jwt.New(jwt.SigningMethodHS256)
	token.Claims = claims
	return token.SignedString([]byte(secretKey))
}
