// Package models provides ...
package models

import (
	"fmt"
	"go_darsing_breed/conf"
	"time"

	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
)

var DB *gorm.DB

func Setup() {
	connUri := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?charset=%s&parseTime=True&loc=Local",
		conf.DataBase.User,
		conf.DataBase.Password,
		conf.DataBase.Host,
		conf.DataBase.Port,
		conf.DataBase.DB,
		conf.DataBase.Charset)

	db, err := gorm.Open(conf.DataBase.Type, connUri)
	if err != nil {
		panic(err)
	}
	DB = db
	gorm.DefaultTableNameHandler = func(db *gorm.DB, defaultTableName string) string {
		return conf.DataBase.Prefix + defaultTableName
	}
}

type BaseModel struct {
	ID           uint64    `gorm:"primary_key" json:"id"`
	CreadtedTime time.Time `json:"created_time"`
	UpdatedTime  time.Time `json:"updated_time"`
	IsDel        bool      `json:"isdel"`
}
