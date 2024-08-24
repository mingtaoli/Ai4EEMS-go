package mediaprop

import (
	"bytes"
	"context"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net/http"

	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/svc"
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/types"

	"github.com/zeromicro/go-zero/core/logx"
)

type CalculatePureFluidPropLogic struct {
	logx.Logger
	ctx    context.Context
	svcCtx *svc.ServiceContext
}

// 计算纯工质物性
func NewCalculatePureFluidPropLogic(ctx context.Context, svcCtx *svc.ServiceContext) *CalculatePureFluidPropLogic {
	return &CalculatePureFluidPropLogic{
		Logger: logx.WithContext(ctx),
		ctx:    ctx,
		svcCtx: svcCtx,
	}
}

func (l *CalculatePureFluidPropLogic) CalculatePureFluidProp(req *types.CoolPropPureFluidRequest) (resp *types.CoolPropPureFluidResponse, err error) {
	// 将请求转换为JSON
	jsonData, err := json.Marshal(req)
	if err != nil {
		return nil, errors.New("failed to marshal request to JSON: " + err.Error())
	}

	// 创建HTTP POST请求，发送到Julia后端
	juliaURL := "http://localhost:19801/coolprop/purefluid/v1/json/" // 替换为实际的Julia服务URL
	response, err := http.Post(juliaURL, "application/json", bytes.NewBuffer(jsonData))
	if err != nil {
		return nil, errors.New("failed to send POST request to Julia service: " + err.Error())
	}
	defer response.Body.Close()

	// 检查响应状态
	if response.StatusCode != http.StatusOK {
		return nil, errors.New("received non-OK response from Julia service: " + response.Status)
	}

	bodyBytes, err := io.ReadAll(response.Body)
	if err != nil {
		return nil, errors.New("failed to read response body: " + err.Error())
	}
	bodyString := string(bodyBytes)
	fmt.Println("Received JSON Response from Julia:", bodyString)

	// 解码JSON响应
	resp = new(types.CoolPropPureFluidResponse)
	err = json.NewDecoder(response.Body).Decode(resp)
	if err != nil {
		return nil, errors.New("failed to decode response from Julia service: " + err.Error())
	}

	return resp, nil
}
