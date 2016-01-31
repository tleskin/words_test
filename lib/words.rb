require_relative 'parser'

class Words
  attr_accessor :parser,
                :to_analyze,
                :sequences,
                :words,
                :output_sequence,
                :output_words,
                :sequences_file,
                :words_file,
                :dictionary

  def initialize(dictionary = ARGV[0], words_file = ARGV[1], sequences_file = ARGV[2])
    @parser = Parser.new
    @dictionary = dictionary
    @words_file = words_file
    @sequences_file = sequences_file
    @output_sequence = []
    @output_words = []
    @sequences = []
    @to_analyze = read_file(@dictionary)
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

  def find_word_matches
    @sequences.each do |sequence|
      words = @to_analyze.select {|word| word.include?(sequence)}
      if words.length == 1
        @output_sequence << sequence
        @output_words << words[0]
      end
    end
  end

  def write_sequences
    File.open( @sequences_file, "w+") do |f|
      @output_sequence.each { |sequence| f.puts(sequence) }
    end
  end

  def write_words
    File.open( @words_file, "w") do |f|
      @output_words.each { |word| f.puts(word) }
    end
  end
end
