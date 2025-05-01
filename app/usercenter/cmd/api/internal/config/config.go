package config

import "github.com/zeromicro/go-zero/rest"

type Config struct {
	rest.RestConf
	Postgresql struct{
		DataSource string
	}
	JwtAuth struct {
		AccessSecret string
		AccessExpire int64
	}
}
