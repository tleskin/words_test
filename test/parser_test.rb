require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require_relative '../lib/parser'

class ParserTest < MiniTest::Test
  def test_it_runs
    assert true
  end

  def setup
    @parser = Parser.new
  end

  def test_it_starts_out_with_an_empty_array
    assert_equal [], @parser.words
  end

  def test_it_can_parse_a_text_file_and_return_an_array
    @parser.parse("test/sample.txt")
    assert_equal ["arrows", "carrots", "give", "me"], @parser.words
  end
end
