require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require_relative '../lib/words'

class WordsTest < MiniTest::Test
  def setup
    @worder = Words.new("test/sample.txt")
  end

  def test_it_parses_the_text_after_initialzation
    assert_equal ["arrows", "carrots", "give", "me"], @worder.to_analyze
  end

  def test_the_read_file_method_returns_an_array
    output = @worder.read_file("test/sample.txt")
    assert_equal ["arrows", "carrots", "give", "me"], output
    assert_equal Array, output.class
  end
end
