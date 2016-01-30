require 'pry'
require_relative 'parser'

class Words
  attr_accessor :parser, :to_analyze, :sequences, :words
  def initialize(dictionary)
    @parser = Parser.new
    @to_analyze = read_file(dictionary)
    @sequences = []
    @words = 'words.txt'
  end

  def read_file(dictionary)
    @parser.parse(dictionary)
  end

  def get_sequences
    @to_analyze.each do |word|

      next if word.length <= 3

      word.chars.each_cons(4) do |seq_arr|
        sequence = seq_arr.join

        next unless sequence =~ /\A[A-Za-z]+\z/

        next if sequences.include?(sequence)

        sequences << sequence
      end
    end
  end
end
