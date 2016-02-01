require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require_relative '../lib/words'

class WordsTest < MiniTest::Test
  def setup
    dictionary = File.open("test/sample.txt").read.split(" ")
    @worder = Words.new(dictionary)
  end

  def test_it_has_the_dictionary_correctly_parsed_into_an_array
    assert_equal ["arrows", "carrots", "give", "me"], @worder.dictionary
    assert_equal Array, @worder.dictionary.class
  end

  def test_it_can_return_an_array_of_sequences_for_the_words
    @worder.get_sequences_and_words
    expected_sequences = ["rrow", "rows", "carr", "rrot", "rots", "give"]
    actual_sequences = @worder.sequences.keys
    assert_equal expected_sequences, actual_sequences
  end

  def test_a_sequences_is_only_four_characters_long
    @worder.get_sequences_and_words
    short_sequences = @worder.sequences.keys.select {|sequence| sequence.length < 3}
    assert_equal 4, @worder.sequences.keys.first.length
    assert_equal 0, short_sequences.length
  end

  def test_it_returns_word_matches_and_sequences
    @worder.get_sequences_and_words
    assert_equal 6, @worder.sequences.keys.length
    assert_equal 6, @worder.sequences.values.length
  end

  def test_it_returns_word_matches_and_sequences_in_correct_order
    @worder.get_sequences_and_words
    first_sequence = @worder.sequences.keys.first
    last_sequence = @worder.sequences.keys.last
    assert_equal true, @worder.sequences.values.first.include?(first_sequence)
    refute_equal true, @worder.sequences.values.first.include?(last_sequence)
    assert_equal true, @worder.sequences.values.last.include?(last_sequence)
    refute_equal true, @worder.sequences.values.last.include?(first_sequence)
  end
end
