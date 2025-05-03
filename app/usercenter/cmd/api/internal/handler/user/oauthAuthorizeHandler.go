package user

import (
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/logic/user"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/types"
	"github.com/zeromicro/go-zero/rest/httpx"
)

// OAuth2 授权端点 (第一步: 请求授权码)
func OauthAuthorizeHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.OAuthAuthorizeReq
		if err := httpx.Parse(r, &req); err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
			return
		}

		l := user.NewOauthAuthorizeLogic(r.Context(), svcCtx)
		err := l.OauthAuthorize(&req)
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
			httpx.Ok(w)
		}
	}
}
