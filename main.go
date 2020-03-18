package main

import (
	"encoding/json"
	"net/http"

	"github.com/astaxie/beego"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	router.Static("./static", "static")
	router.LoadHTMLGlob("./view/*")

	router.GET("/login", loginTpl)
	router.GET("/register", registerTpl)

	router.POST("/login", loginImpl)

	router.Run(":8080")
}

var GInput = Input{Phone: "12345", Password: "12345"}

var loginImpl = func(ctx *gin.Context) {
	var (
		input   Input
		retData = make(ResponseParams, 16)
		err     error
	)

	if err = json.NewDecoder(ctx.Request.Body).Decode(&input); err != nil {
		beego.Error(err)
		retData["code"] = 2
		retData["msg"] = "invalid_input_params"
		ctx.JSON(http.StatusOK, &retData)
		return
	}

	beego.Info("请求参数", input)

	if input != GInput {
		beego.Error("账号或密码错误，登陆失败")
		retData["code"] = 2
		retData["msg"] = "login_err"
		ctx.JSON(http.StatusOK, &retData)
		return
	} else {
		beego.Info("登陆成功")
		retData["code"] = 1
		retData["msg"] = "success"
		ctx.JSON(http.StatusOK, &retData)
		return
	}
}

type Input struct {
	Phone    string `json:"phone"`
	Password string `json:"password"`
}

type ResponseParams map[string]interface{}

var loginTpl = func(ctx *gin.Context) {
	ctx.HTML(http.StatusOK, "login.tpl", nil)
}

var registerTpl = func(ctx *gin.Context) {
	ctx.HTML(http.StatusOK, "register.tpl", nil)
}
