package user

import (
	"context"

	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type OauthTokenLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// OAuth2 令牌端点 (第二步: 用授权码换取访问令牌)
func NewOauthTokenLogic(ctx context.Context, svcCtx *svc.ServiceContext) *OauthTokenLogic {
	return &OauthTokenLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *OauthTokenLogic) OauthToken(req *types.OAuthTokenReq) (resp *types.OAuthTokenResp, err error) {
	// todo: add your logic here and delete this line

	return
}
