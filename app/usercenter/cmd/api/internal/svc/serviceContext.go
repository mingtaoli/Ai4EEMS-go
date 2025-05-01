package svc

import (
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/config"
)

type ServiceContext struct {
	Config config.Config
	UsersModel model.Ai4energyUserModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	postgresConn := sqlx.Postgresql(c.Postgresql.DataSource)
	return &ServiceContext{
		Config: c,
		UsersModel: model.NewAi4energyUserModel(postgresConn),
	}
}
