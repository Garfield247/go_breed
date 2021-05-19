package conf

import (
	"time"

	"github.com/go-ini/ini"
)

type SqlDataBase struct {
	Type     string
	Host     string
	Port     string
	User     string
	Password string
	DB       string
	Charset  string
	Prefix   string
}

type Redis struct {
	Host     string
	Port     string
	Password string
	DB       int
}

type Jwt struct {
	SecretKey string
}

type Project struct {
	MsgCodeLength int
	MediaFilePath string
}

type Server struct {
	Port         string
	ReadTimeOut  time.Duration
	WriteTimeOut time.Duration
}

var (
	DataBase     = &SqlDataBase{}
	RedisCfg     = &Redis{}
	JwtSecretKey = &Jwt{}
	ProjectCfg   = &Project{}
	ServerCfg    = &Server{}
)

func Setup() {
	cfg, err := ini.Load("conf/config.ini")
	if err != nil {
		panic(err)
	}
	if err := cfg.Section("mysql").MapTo(DataBase); err != nil {
		panic(err)
	}
	if err := cfg.Section("redis").MapTo(RedisCfg); err != nil {
		panic(err)
	}
	if err := cfg.Section("jwt").MapTo(JwtSecretKey); err != nil {
		panic(err)
	}
	if err := cfg.Section("project").MapTo(ProjectCfg); err != nil {
		panic(err)
	}
	if err := cfg.Section("server").MapTo(ServerCfg); err != nil {
		panic(err)
	}

}
