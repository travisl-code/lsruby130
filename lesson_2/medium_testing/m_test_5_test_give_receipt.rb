# Test CashRegister#give_receipt method

require 'minitest/autorun'

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def test_give_receipt
    register = CashRegister.new(100)
    transaction = Transaction.new(50)
    str = "You've paid $50.\n"

    assert_output(str) {register.give_receipt(transaction) }
    assert_nil(register.give_receipt(transaction))
  end
end
