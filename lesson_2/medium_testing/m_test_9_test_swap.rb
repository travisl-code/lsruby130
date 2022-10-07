require 'minitest/autorun'

require_relative 'text.rb'
# require_relative 'sample_text.rb'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT

    assert_equal expected_text, @text.swap('a', 'e')
  end

  def teardown
    @file.close
  end
end
