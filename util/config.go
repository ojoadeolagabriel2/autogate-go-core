package util

import (
	"os"
)

const (
	EmptyString = ""
)

func GetConfig(key string, defaultValue string) string {
	value := os.Getenv(key)
	if value != EmptyString {
		return value
	}
	return defaultValue
}