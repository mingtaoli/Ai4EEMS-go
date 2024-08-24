package mediaprop

import (
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/logic/mediaprop"
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/types"
	"github.com/zeromicro/go-zero/rest/httpx"
)

// 计算纯工质物性
func CalculatePureFluidPropHandler(svcCtx *svc.ServiceContext) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		var req types.CoolPropPureFluidRequest
		if err := httpx.Parse(r, &req); err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
			return
		}

		l := mediaprop.NewCalculatePureFluidPropLogic(r.Context(), svcCtx)
		resp, err := l.CalculatePureFluidProp(&req)
		if err != nil {
			httpx.ErrorCtx(r.Context(), w, err)
		} else {
			httpx.OkJsonCtx(r.Context(), w, resp)
		}
	}
}
