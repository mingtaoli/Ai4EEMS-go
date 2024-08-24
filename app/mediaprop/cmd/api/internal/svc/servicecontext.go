package svc

import (
	"github.com/ai4energy/Ai4EEMS-go/app/mediaprop/cmd/api/internal/config"
)

type ServiceContext struct {
	Config config.Config
}

func NewServiceContext(c config.Config) *ServiceContext {
	return &ServiceContext{
		Config: c,
	}
}
