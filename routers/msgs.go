package routers

import (
	"go_darsing_breed/hanlders"

	"github.com/gin-gonic/gin"
)

func MsgsRouter(e *gin.Engine) {
	msgs := e.Group("/msgs")
	msgs.POST("/code", hanlders.SendMsgsCode)
}
