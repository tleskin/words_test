require_relative 'lib/words'

if ARGV[0].nil? && ARGV[1].nil? && ARGV[2].nil?
  worder = Words.new("lib/dictionary.txt",
                      "lib/words.txt",
                      "lib/sequences.txt")
else
  worder = Words.new
end

worder.get_sequences
worder.find_word_matches
worder.write_sequences
worder.write_words
puts "Please check 'lib/words.txt' and 'lib/sequences.txt' for words and sequences."
