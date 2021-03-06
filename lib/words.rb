class Words
  attr_accessor :sequences, :dictionary, :duplicates

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences = {}
    @duplicates = {}
  end

  def get_sequences_and_words
    @dictionary.each do |word|
      next if word.length <= 3
      next unless word =~ /\A[A-Za-z]+\z/
      analyzer(word)
    end
  end

  def analyzer(word)
    word.chars.each_cons(4).map(&:join).each do |sequence|
      if duplicates.key?(sequence)
        sequences.delete(sequence)
      elsif !sequences.key?(sequence)
        sequences[sequence] = word
      elsif sequences.key?(sequence)
        duplicates[sequence] = word
        sequences.delete(sequence)
      end
    end
  end
end
