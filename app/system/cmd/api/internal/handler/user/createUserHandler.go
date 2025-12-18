// Code scaffolded by goctl. Safe to edit.
// goctl 1.9.2

package user

import (
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/system/cmd/api/internal/logic/user"
	"github.com/ai4energy/Ai4EEMS-go/app/system/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/system/cmd/api/internal/types"
	"github.com/zeromicro/go-zero/rest/httpx"
)

// 新增用户
func CreateUserHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.UserCreateReq
		if err := httpx.Parse(r, &req); err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
			return
		}

		l := user.NewCreateUserLogic(r.Context(), svcCtx)
		resp, err := l.CreateUser(&req)
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
			httpx.OkJsonCtx(r.Context(), w, resp)
		}
	}
}
