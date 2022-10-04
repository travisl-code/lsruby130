# Modify date format again

# def format_date(str)
#   str.sub(/\A(\d{4})([-\/])(\d{2})(\2)(\d{2})/, '\5.\3.\1')
# end

def format_date(str)
  str.sub(/\A(?<year>\d{4})(?<delimit>[-\/])(?<month>\d{2})\k<delimit>(?<day>\d{2})/, '\k<day>.\k<month>.\k<year>')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)
