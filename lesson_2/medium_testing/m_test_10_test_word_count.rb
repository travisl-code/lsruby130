require 'minitest/autorun'

require_relative 'text.rb'

class TextTest < Minitest::Test
  def setup
    @file = File.new('sample_text.txt', 'r')
    @text = Text.new(@file.read)
  end

  def test_word_count
    text_words = 72
    assert_equal text_words, @text.word_count
  end

  def teardown
    @file.close
  end
end
