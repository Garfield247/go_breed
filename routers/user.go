package routers

import (
	"go_darsing_breed/hanlders"

	"github.com/gin-gonic/gin"
)

func UserRouter(e *gin.Engine) {
	user := e.Group("/user")
	user.GET("/info/:uid", hanlders.GetUserInfo)
	user.POST("/info", hanlders.UserRegister)
}
