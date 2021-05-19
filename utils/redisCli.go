package utils

import (
	"fmt"
	"go_darsing_breed/conf"

	"github.com/go-redis/redis"
)

var RedisDB *redis.Client

func RedisSetup() {
	redisDB := redis.NewClient(&redis.Options{
		Addr:     fmt.Sprintf("%s:%s", conf.RedisCfg.Host, conf.RedisCfg.Port),
		Password: conf.RedisCfg.Password,
		DB:       conf.RedisCfg.DB})
	RedisDB = redisDB
}
