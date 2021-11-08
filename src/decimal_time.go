package main

import (
	"flag"
	"fmt"
	"os"
	"time"
)

const (
	msInDay     = 86_400_000
	msInDHour   = 8_640_000
	msInDSecond = 864
)

var format = flag.String("f", "long", "output format (long, short, hour, minute, second)")
var padding = flag.Bool("0", false, "toggle zero-padding for hour")

type printFunction func(h, m, s int)

func main() {
	flag.Parse()

	now := time.Now()
	_, tempOffset := now.Zone()
	offset := int64(tempOffset * 1000)

	printFunc := getPrintFunction()
	printFunc(calculate(offset))
}

func calculate(offset int64) (h, m, s int) {
	unixTime := time.Now().UnixMilli()
	secOfDay := int((unixTime + offset) % msInDay)

	h = secOfDay / msInDHour
	secOfDay -= h * msInDHour

	s = secOfDay / msInDSecond
	m = s / 100
	s %= 100
	return
}

func getPrintFunction() printFunction {
	var f printFunction
	if *padding {
		switch *format {
		case "long":
			f = func(h, m, s int) { fmt.Printf("%02d.%02d%02d\n", h, m, s) }
		case "short":
			f = func(h, m, s int) { fmt.Printf("%02d.%02d\n", h, s) }
		case "hour":
			f = func(h, m, s int) { fmt.Printf("%02d\n", h) }
		case "minute":
			f = func(h, m, s int) { fmt.Printf("%02d\n", m) }
		case "second":
			f = func(h, m, s int) { fmt.Printf("%02d\n", s) }
		default:
			fmt.Printf("Unknown format: %s\n", *format)
			os.Exit(1)
		}
	} else {
		switch *format {
		case "long":
			f = func(h, m, s int) { fmt.Printf("%d.%02d%02d\n", h, m, s) }
		case "short":
			f = func(h, m, s int) { fmt.Printf("%d.%02d\n", h, m) }
		case "hour":
			f = func(h, m, s int) { fmt.Printf("%d\n", h) }
		case "minute":
			f = func(h, m, s int) { fmt.Printf("%d\n", m) }
		case "second":
			f = func(h, m, s int) { fmt.Printf("%d\n", s) }
		default:
			fmt.Printf("Unknown format: %s\n", *format)
			os.Exit(1)
		}
	}
	return f
}
