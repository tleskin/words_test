class Words
  attr_accessor :sequences,
                :words,
                :sequences_file,
                :words_file,
                :dictionary

  def initialize(dictionary, words_file, sequences_file)
    @dictionary = dictionary
    @words_file = words_file
    @sequences_file = sequences_file
    @sequences = {}
  end

  def get_sequences_and_words
    @dictionary.each do |word|
      next if word.length <= 3
      next unless word =~ /\A[A-Za-z]+\z/
      word.chars.each_cons(4).map(&:join).each do |sequence|
        if !sequences.key?(sequence)
          sequences[sequence] = word
        else
          sequences.delete(sequence)
        end
      end
    end
  end

  def write_sequences
    File.open( sequences_file, "w") do |f|
        sequences.keys.each { |sequence| f.puts(sequence) }
    end
  end

  def write_words
    File.open( words_file, "w") do |f|
      sequences.values.each { |word| f.puts(word) }
    end
  end
end
