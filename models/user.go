package models

import (
	"time"

	"golang.org/x/crypto/bcrypt"
)

const PasswordCryptLevel = 12

type User struct {
	BaseModel
	Phone     string    `gorm:"column:phone;not null;unique_index;comment:'手机号'" json:"phone"`
	Password  string    `gorm:"column:password;comment:'密码'" json:"-"`
	Paypwd    string    `gorm:"column:paypwd;comment:'支付密码'" json:"-"`
	Lastlogin time.Time `gorm:"column:lastlogin;comment:'最后登录时间'" json:"lastlogin"`
}

func (u *User) TableName() string {
	return "user"
}

func (u *User) GetUserById(uid uint) *User {
	DB.Model(&User{}).First(u, uid)
	if u.ID > 0 {
		return u
	} else {
		return nil
	}
}

func (u *User) SetPassword(password string) error {
	p, err := bcrypt.GenerateFromPassword([]byte(password), PasswordCryptLevel)
	if err != nil {
		return nil
	}
	u.Password = string(p)
	return nil
}

func (u *User) CheckPassword() bool {
	password := u.Password
	DB.Where("phone = ?", u.Phone).First(&u)
	err := bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return err == nil
}

func (u *User) IsPasswordEqual(password string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(u.Password), []byte(password))
	return err == nil
}

func (u *User) CheckDuplicatePhone() bool {
	var count int
	if DB.Model(&User{}).Where("phone = ?", u.Phone).Count(&count); count > 0 {
		return false
	} else {
		return true
	}
}
