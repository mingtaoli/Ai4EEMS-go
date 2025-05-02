package user

import (
	"context"
	"fmt"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/model"

	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type LoginLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// login
func NewLoginLogic(ctx context.Context, svcCtx *svc.ServiceContext) *LoginLogic {
	return &LoginLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *LoginLogic) Login(req *types.LoginReq) (resp *types.LoginResp, err error) {
	// todo: add your logic here and delete this line
	// l.svcCtx.UsersModel.

	var user *model.Ai4energyUser
	user, err = l.svcCtx.UsersModel.FindOne(context.Background(), 1)
	fmt.Println(user, err)
	return
}
