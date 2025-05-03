package user

import (
	"context"

	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type OauthAuthorizeLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// OAuth2 授权端点 (第一步: 请求授权码)
func NewOauthAuthorizeLogic(ctx context.Context, svcCtx *svc.ServiceContext) *OauthAuthorizeLogic {
	return &OauthAuthorizeLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *OauthAuthorizeLogic) OauthAuthorize(req *types.OAuthAuthorizeReq) error {
	// todo: add your logic here and delete this line

	return nil
}
