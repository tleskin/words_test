require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require_relative '../lib/words'

class WordsTest < MiniTest::Test
  def setup
    @worder = Words.new("test/sample.txt",
                        "test/words.txt",
                        "test/sequences.txt")
  end

  def teardown
    # File.open("test/words.txt", 'w') {}
    # File.open("test/words.txt", 'w') {}
    File.truncate("test/sequences.txt", 0)
    File.truncate("test/words.txt", 0)
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

  def test_a_sequences_is_only_four_characters_long
    @worder.get_sequences
    short_sequences = @worder.sequences.select {|sequence| sequence.length < 3}
    assert_equal 4, @worder.sequences.first.length
    assert_equal 0, short_sequences.length
  end

  def test_it_returns_word_matches_and_sequences
    @worder.get_sequences
    @worder.find_word_matches
    assert_equal 6, @worder.output_sequence.length
    assert_equal 6, @worder.output_words.length
  end

  def test_it_returns_word_matches_and_sequences_in_correct_order
    @worder.get_sequences
    @worder.find_word_matches
    first_sequence = @worder.output_sequence.first
    last_sequence = @worder.output_sequence.last
    assert_equal true, @worder.output_words.first.include?(first_sequence)
    refute_equal true, @worder.output_words.first.include?(last_sequence)
    assert_equal true, @worder.output_words.last.include?(last_sequence)
    refute_equal true, @worder.output_words.last.include?(first_sequence)
  end

  def test_it_writes_the_sequences_to_a_text_file
    @worder.get_sequences
    @worder.find_word_matches
    @worder.write_sequences
    sequences = ["rrow", "rows", "carr", "rrot", "rots", "give"]
    assert_equal sequences, @worder.parser.parse("test/sequences.txt")
    assert_equal 6, sequences.length
  end

  def test_it_writes_the_words_to_a_text_file
    @worder.get_sequences
    @worder.find_word_matches
    @worder.write_words
    words = ["arrows", "arrows", "carrots", "carrots", "carrots", "give"]
    assert_equal words, @worder.parser.parse("test/words.txt")
    assert_equal 6, words.length
  end
end
