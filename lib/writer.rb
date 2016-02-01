class Writer
  attr_reader :sequences,
              :sequences_file,
              :words_file

  def initialize(sequences, words_file, sequences_file)
    @sequences = sequences
    @sequences_file = sequences_file
    @words_file = words_file
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
