require 'minitest/autorun'
# require_relative usually here

def square_root(value)
end

class SquareRootTest < Minitest::Test
  def test_that_square_root_of_9_is_3
    result = square_root(9)
    assert_equal 3, result
  end
end
