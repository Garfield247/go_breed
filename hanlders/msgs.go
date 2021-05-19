package hanlders

import (
	"fmt"
	"go_darsing_breed/conf"
	"go_darsing_breed/utils"
	"time"

	"github.com/gin-gonic/gin"
)

type SendMsgsCodeRequestJson struct {
	Phone string `json:"phone"`
}

func SendMsgsCode(ctx *gin.Context) {
	resp := Response{Ctx: ctx}
	code, msg, results := 0, "ok", make(map[string]interface{})
	respJson := SendMsgsCodeRequestJson{}
	ctx.BindJSON(&respJson)
	phone := respJson.Phone
	msgCode := utils.GenValidateCode(conf.ProjectCfg.MsgCodeLength)
	err := utils.SendMsgsCode(phone, msgCode)
	if err != nil {
		code, msg = 999, "短信发送失败"
		return
	}
	utils.RedisDB.Set(fmt.Sprintf("msgcode:%s", phone), msgCode, time.Second*60*5)
	resp.Response(code, msg, results)
}
