# Write everything needed for testing, no cases

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'



class CashRegisterTest < Minitest::Test
end