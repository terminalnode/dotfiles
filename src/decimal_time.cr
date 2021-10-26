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

if mode == "long"
  puts "#{decimalHour}.#{"%05.2f" % decimalMinute}"
elsif mode == "short"
  puts "#{decimalHour}.#{"%02i" % decimalMinute}"
elsif mode == "hour"
  puts "%02i" % decimalHour
elsif mode == "minute"
  puts "%02i" % decimalMinute.to_i
elsif mode == "second"
  puts "%02i" % (decimalMinute / 100).to_s[4, 2]
elsif mode == "help"
  puts <<-HELPTEXT
  Usage: decimal_time [OPTION]
  Show the current time in decimal time, where we have 10 hours per day and
  every hour consists of 100 minutes (which can be further divided into 100
  seconds).

  If no format is specified the default is long.

  OPTION    EXAMPLE     Padding
  long      1.23.45     Hour is not zero-padded
  short     1.23        Hour is not zero-padded
  hour      01          Zero-padded
  minute    23          Zero-padded
  second    45          Zero-padded
  HELPTEXT
end
