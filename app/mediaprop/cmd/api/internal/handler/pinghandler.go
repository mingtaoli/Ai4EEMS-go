package handler

import (
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/logic"
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/svc"
	"github.com/zeromicro/go-zero/rest/httpx"
)

// Ping用于健康检查
func pingHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		l := logic.NewPingLogic(r.Context(), svcCtx)
		resp, err := l.Ping()
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
			httpx.OkJsonCtx(r.Context(), w, resp)
		}
	}
}
