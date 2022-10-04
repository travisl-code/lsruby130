# Modify '2021-06-03' date format to '03.06.2021' format

def format_date(str)
  str.sub(/(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2016/06/17') # -> '2016/06/17' (no change)
