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

  def test_it_can_return_an_array_of_sequences_for_the_words
    @worder.get_sequences
    expected_sequences = ["arro", "rrow", "rows", "carr", "rrot", "rots", "give"]
    assert_equal Array, @worder.sequences.class
    assert_equal expected_sequences, @worder.sequences
  end

  def test_a_sequences_is_only_added_to_the_array_once
    @worder.get_sequences
    selected_sequences = @worder.sequences.select {|sequence| sequence == "arro"}
    refute_equal 2, selected_sequences.length
    assert_equal 1, selected_sequences.length
  end
end
