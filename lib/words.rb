require 'pry'
require_relative 'parser'

class Words
  attr_accessor :parser, :to_analyze, :sequences, :words
  def initialize(dictionary)
    @parser = Parser.new
    @to_analyze = read_file(dictionary)
    @sequences = 'sequences.txt'
    @words = 'words.txt'
  end

  def read_file(dictionary)
    @parser.parse(dictionary)
  end
end
