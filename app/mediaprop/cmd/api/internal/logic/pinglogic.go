package logic

import (
	"context"
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type PingLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// Ping用于健康检查
func NewPingLogic(ctx context.Context, svcCtx *svc.ServiceContext) *PingLogic {
	return &PingLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *PingLogic) Ping() (resp *types.PingResponse, err error) {
	resp = &types.PingResponse{
		Message: "pong",        // 设置响应消息为 "pong"
		Code:    http.StatusOK, // 设置HTTP状态码为 200
	}

	return resp, nil
}
