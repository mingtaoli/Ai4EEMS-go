package svc

import (
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/cmd/api/internal/config"
	"github.com/ai4energy/Ai4EEMS-go/app/usercenter/model"
	_ "github.com/jackc/pgx/v5/stdlib"
	"github.com/zeromicro/go-zero/core/stores/sqlx"
)

type ServiceContext struct {
	Config     config.Config
	UsersModel model.UserModel
}

func NewServiceContext(c config.Config) *ServiceContext {
	postgresConn := sqlx.NewSqlConn("pgx", c.Postgresql.DataSource)
	return &ServiceContext{
		Config:     c,
		UsersModel: model.NewUserModel(postgresConn),
	}
}
