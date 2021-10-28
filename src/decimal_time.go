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

/*
Plan is to make a feature that loops this program so it can output new timestamps
whenever there's a change (i.e. if the format includes seconds, that's every second,
if it doesn't it may be every minute or even every hour).

To avoid calculating offset and printF separately within the loop they're calculated
and stored outside of the calculate-function.
*/
var offset int64
var printF func(h int, m int, s int)

func main() {
	flag.Parse()

	now := time.Now()
	_, tempOffset := now.Zone()
	offset = int64(tempOffset * 1000)

	assignPrintF()

	printF(calculate())
}

func calculate() (h, m, s int) {
	unixTime := time.Now().UnixMilli()
	secOfDay := int((unixTime + offset) % msInDay)

	h = secOfDay / msInDHour
	secOfDay -= h * msInDHour

	s = secOfDay / msInDSecond
	m = s / 100
	s %= 100
	return
}

func assignPrintF() {
	if *padding {
		switch *format {
		case "long":
			printF = func(h int, m int, s int) { fmt.Printf("%02d.%02d%02d\n", h, m, s) }
		case "short":
			printF = func(h int, m int, s int) { fmt.Printf("%02d.%02d\n", h, s) }
		case "hour":
			printF = func(h int, m int, s int) { fmt.Printf("%02d\n", h) }
		case "minute":
			printF = func(h int, m int, s int) { fmt.Printf("%02d\n", m) }
		case "second":
			printF = func(h int, m int, s int) { fmt.Printf("%02d\n", s) }
		default:
			fmt.Printf("Unknown format: %s\n", *format)
			os.Exit(1)
		}
	} else {
		switch *format {
		case "long":
			printF = func(h int, m int, s int) { fmt.Printf("%d.%02d%02d\n", h, m, s) }
		case "short":
			printF = func(h int, m int, s int) { fmt.Printf("%d.%02d\n", h, m) }
		case "hour":
			printF = func(h int, m int, s int) { fmt.Printf("%d\n", h) }
		case "minute":
			printF = func(h int, m int, s int) { fmt.Printf("%d\n", m) }
		case "second":
			printF = func(h int, m int, s int) { fmt.Printf("%d\n", s) }
		default:
			fmt.Printf("Unknown format: %s\n", *format)
			os.Exit(1)
		}
	}
}
