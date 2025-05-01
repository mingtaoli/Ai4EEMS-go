package model

import "github.com/zeromicro/go-zero/core/stores/sqlx"

var _ Ai4energyUserModel = (*customAi4energyUserModel)(nil)

type (
	// Ai4energyUserModel is an interface to be customized, add more methods here,
	// and implement the added methods in customAi4energyUserModel.
	Ai4energyUserModel interface {
		ai4energyUserModel
		withSession(session sqlx.Session) Ai4energyUserModel
	}

	customAi4energyUserModel struct {
		*defaultAi4energyUserModel
	}
)

// NewAi4energyUserModel returns a model for the database table.
func NewAi4energyUserModel(conn sqlx.SqlConn) Ai4energyUserModel {
	return &customAi4energyUserModel{
		defaultAi4energyUserModel: newAi4energyUserModel(conn),
	}
}

func (m *customAi4energyUserModel) withSession(session sqlx.Session) Ai4energyUserModel {
	return NewAi4energyUserModel(sqlx.NewSqlConnFromSession(session))
}
