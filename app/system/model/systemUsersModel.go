package model

import "github.com/zeromicro/go-zero/core/stores/sqlx"

var _ SystemUsersModel = (*customSystemUsersModel)(nil)

type (
	// SystemUsersModel is an interface to be customized, add more methods here,
	// and implement the added methods in customSystemUsersModel.
	SystemUsersModel interface {
		systemUsersModel
		withSession(session sqlx.Session) SystemUsersModel
	}

	customSystemUsersModel struct {
		*defaultSystemUsersModel
	}
)

// NewSystemUsersModel returns a model for the database table.
func NewSystemUsersModel(conn sqlx.SqlConn) SystemUsersModel {
	return &customSystemUsersModel{
		defaultSystemUsersModel: newSystemUsersModel(conn),
	}
}

func (m *customSystemUsersModel) withSession(session sqlx.Session) SystemUsersModel {
	return NewSystemUsersModel(sqlx.NewSqlConnFromSession(session))
}
