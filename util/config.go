package util

import (
	"os"
	"strconv"
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

func GetIntConfig(key string, defaultValue int) int {
	value := os.Getenv(key)
	if value != EmptyString {
		intValue, _ := strconv.Atoi(value)
		return intValue
	}
	return defaultValue
}