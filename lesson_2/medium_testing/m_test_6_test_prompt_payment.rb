# Test Transaction#prompt_for_payment
# Set payment correctly...

require 'minitest/autorun'

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction_1 = Transaction.new(50)
    input = StringIO.new('50\n')
    transaction_1.prompt_for_payment(input: input)

    assert_equal 50, transaction_1.amount_paid
  end
end
