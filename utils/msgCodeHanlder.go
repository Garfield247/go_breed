package utils

import (
	"fmt"
	"math/rand"
	"strings"
	"time"
)

func GenValidateCode(width int) string {
	nums := [10]byte{0, 1, 2, 3, 4, 5, 6, 7, 8, 9}
	numslen := len(nums)
	rand.Seed(time.Now().UnixNano())

	var codeString strings.Builder
	for i := 0; i < width; i++ {
		fmt.Fprintf(&codeString, "%d", nums[rand.Intn(numslen)])
	}
	return codeString.String()
}
