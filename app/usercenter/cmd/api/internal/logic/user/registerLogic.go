package user

import (
	"context"

	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
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
	// todo: add your logic here and delete this line
	mobile := sql.NullString{
		String: req.Mobile,
		Valid:  true,
	}

	user, err := l.svcCtx.UsersModel.FindOneByMobile(
		context.Background(),
		mobile,
	)
	if err != nil && !errors.Is(err, sqlx.ErrNotFound) {
		l.Errorf("查找用户时出错: %v", err)
		return nil, err
	}
	if user != nil {
		return nil, errors.New("手机号已被注册")
	}
	// 插入新用户到数据库
	newUser := &model.Ai4energyUser{
		Mobile:   mobile,
		Password: req.Password,
	}
	userId, err := l.svcCtx.UsersModel.Insert(context.Background(), newUser)
	if err != nil {
		l.Errorf("插入用户时出错: %v", err)
		return nil, err
	}
	// 获取插入后的用户ID
	newUser.Id, err = userId.LastInsertId()
	if err != nil {
		l.Errorf("获取用户ID时出错: %v", err)
		return nil, err
	}
	return
}
