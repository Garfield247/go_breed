package utils

import "fmt"

func SendMsgsCode(phone string, msgCode string) error {

	fmt.Printf("phone:%s,msgCode:%s\n", phone, msgCode)
	return nil
}
