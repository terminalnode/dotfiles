# Output the current time in decimal time / metric time.
# Decimal time is a system of time keeping where there are 10 hours in
# a day, 100 minutes in an hour and 100 seconds in a minute.
#
# Seconds in a day:             86400
# Seconds in a decimal hour:    8640
# Seconds in a decimal minute:  86.4
# The decimals of the decimal minute will be used as decimal seconds.
mode = ARGV[0]? || "long"

now = Time.local
secondsPassed = (now.to_unix + now.offset) % 86400
decimalHour, secondsPassed = secondsPassed.divmod(8640)
decimalMinute = secondsPassed / 86.4

def pad(n : Number)
  padding = ARGV[1]? || "unpadded"
  if padding == "padded" "%02i" % n else "%2i" % n end
end

if mode == "long"
  puts "#{pad(decimalHour)}.#{"%05.2f" % decimalMinute}"
elsif mode == "short"
  puts "#{pad(decimalHour)}.#{"%02i" % decimalMinute}"
elsif mode == "hour"
  puts pad(decimalHour)
elsif mode == "minute"
  puts pad(decimalMinute.to_i)
elsif mode == "second"
  puts pad(decimalMinute * 100 % 100)
elsif mode == "help"
  puts <<-HELPTEXT
  Usage: decimal_time [FORMAT] [PADDING]
  Show the current time in decimal time, where we have 10 hours per day and
  every hour consists of 100 minutes (which can be further divided into 100
  seconds).

  If no format is specified the default is long.
  If no padding is specified the default is unpadded

  FORMAT    PADDING     EXAMPLE
  long      padded      01.02.03
  short     padded      01.02
  hour      padded      01
  minute    padded      02
  second    padded      03

  long      unpadded    1.02.03
  short     unpadded    1.02
  hour      unpadded    1
  minute    unpadded    2
  second    unpadded    3
  HELPTEXT
end
