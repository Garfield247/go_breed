package middlewares

//import (
//"go_darsing_breed/hanlders"
//"strings"

//"github.com/gin-gonic/gin"
//)

//func AuthTokenMiddleware() gin.HandlerFunc {
//return func(ctx *gin.Context) {
//resp := hanlders.Response{Ctx: ctx}

//tokenStr := ctx.Request.Header.Get("Authentication")
//if len([]rune(tokenStr)) == 0 {
//code, msg, results := 104, "未登录", make(map[interface{}]interface{})
//resp.Response(code, msg, results)
//return
//}
//strs := strings.Split(tokenStr, " ")
//if strs[0] != "Bearer" {
//code, msg, results := 101, "格式不正确", make(map[interface{}]interface{})
//resp.Response(code, msg, results)
//return
//}

//ctx.Next()
//}
//}
