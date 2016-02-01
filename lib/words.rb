class Words
  attr_accessor :sequences, :dictionary

  def initialize(dictionary)
    @dictionary = dictionary
    @sequences = {}
  end

  def get_sequences_and_words
    @dictionary.each do |word|
      next if word.length <= 3
      next unless word =~ /\A[A-Za-z]+\z/
      word.chars.each_cons(4).map(&:join).each do |sequence|
        !sequences.key?(sequence) ? sequences[sequence] = word :sequences.delete(sequence)
      end
    end
  end
end
