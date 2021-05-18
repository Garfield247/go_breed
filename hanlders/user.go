package hanlders

import (
	"go_darsing_breed/models"
	"time"

	"github.com/gin-gonic/gin"
)

func UserRegister(ctx *gin.Context) {
	resp := Response{Ctx: ctx}
	code, msg, results := 0, "ok", make(map[string]interface{})
	phone := ctx.PostForm("phone")
	password := ctx.PostForm("password")
	new_user := &models.User{}
	new_user.Phone = phone
	new_user.Password = password
	new_user.Lastlogin = time.Now()
	new_user.CreatedTime = time.Now()
	new_user.UpdatedTime = time.Now()
	models.DB.Create(new_user)
	resp.Response(code, msg, results)

}

func UserLoginbyPhone(ctx *gin.Context) {

}

func GetUserInfo(ctx *gin.Context) {
	resp := Response{Ctx: ctx}
	code, msg, results := 0, "ok", make(map[string]interface{})
	uid := ctx.Param("uid")
	results["id"] = uid
	resp.Response(code, msg, results)

}

func GetUserAsset(ctx *gin.Context) {

}
