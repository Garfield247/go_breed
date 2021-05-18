// Package routers provides ...
package routers

import "github.com/gin-gonic/gin"

func InitRouter() *gin.Engine {
	engine := gin.New()
	engine.Use(gin.Logger())
	engine.Use(gin.Recovery())
	UserRouter(engine)

	return engine
}
