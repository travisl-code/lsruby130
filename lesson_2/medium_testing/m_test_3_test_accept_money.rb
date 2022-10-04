require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(100)
    @transaction_small = Transaction.new(50)
    @transaction_exact = Transaction.new(100)
    @transaction_big = Transaction.new(200)
  end
  
  def test_accept_money

    assert_equal(100, @register.total_money)
    @transaction_exact.amount_paid = 100
    @register.accept_money(@transaction_exact)
    assert_equal(200, @register.total_money)
  end
end
