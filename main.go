package main

import (
	"fmt"
	"go_darsing_breed/conf"
	"go_darsing_breed/models"
	"go_darsing_breed/routers"
	"go_darsing_breed/utils"
)

func init() {
	conf.Setup()
	models.Setup()
	utils.RedisSetup()
}

func main() {
	fmt.Println(conf.DataBase)
	fmt.Println(conf.ProjectCfg)
	fmt.Println(conf.JwtSecretKey)
	fmt.Println(conf.ServerCfg)
	fmt.Println(models.DB)
	fmt.Println("darsing")
	r := routers.InitRouter()
	r.Run()
}
