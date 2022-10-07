# Test for `CashRegister#change`

require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def test_change
    register = CashRegister.new(100)
    transaction_1 = Transaction.new(50)
    transaction_1.amount_paid = 100
    
    assert_equal(50, register.change(transaction_1))
  end
end
