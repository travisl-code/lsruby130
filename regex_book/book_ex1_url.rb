# Return true if string looks like URL, false otherwise

require 'pry'

def url?(str)
  !!(str =~ /\Ahttps?:\/\/\S+\z/)
end

p url?('http://launchschool.com')   # -> true
p url?('https://example.com')       # -> true
p url?('https://example.com hello') # -> false
p url?('   https://example.com')    # -> false
