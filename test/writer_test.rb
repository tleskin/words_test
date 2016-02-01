require 'minitest/autorun'
require 'minitest'
require 'minitest/pride'
require_relative '../lib/writer'

class WriterTest < MiniTest::Test
  attr_accessor :writer
  def setup
    sequences_file = "test/sequences.txt"
    words_file = "test/words.txt"
    sequences = {"rrow"=>"arrows", "rows"=>"arrows", "carr"=>"carrots", "rrot"=>"carrots", "rots"=>"carrots", "give"=>"give"}
    @writer = Writer.new(sequences, words_file, sequences_file)
  end

  def teardown
    File.truncate("test/sequences.txt", 0)
    File.truncate("test/words.txt", 0)
  end

  def test_it_writes_the_sequences_to_a_text_file
    writer.write_sequences
    sequences = ["rrow", "rows", "carr", "rrot", "rots", "give"]
    computed_sequences = File.open("test/sequences.txt").read.split(" ")
    assert_equal sequences, computed_sequences
    assert_equal 6, computed_sequences.length
  end

  def test_it_writes_the_words_to_a_text_file
    writer.write_words
    words = ["arrows", "arrows", "carrots", "carrots", "carrots", "give"]
    computed_words = File.open("test/words.txt").read.split(" ")
    assert_equal words, computed_words
    assert_equal 6, computed_words.length
  end
end
