package hanlders

import "github.com/gin-gonic/gin"

const (
	Success = 0
)

type Response struct {
	Ctx *gin.Context
}

type JsonResponse struct {
	Code    int         `json:"code"`
	Msg     string      `json:"msg"`
	Results interface{} `json:"results,omitempty"`
}

func (resp *Response) Response(code int, msg string, results interface{}) {
	resp.Ctx.JSON(200, JsonResponse{
		Code:    code,
		Msg:     msg,
		Results: results,
	})
}
