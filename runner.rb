require_relative 'lib/words'

dictionary = File.open("lib/dictionary.txt").read.split(" ")
sequences_file = "lib/sequences.txt"
words_file = "lib/words.txt"

worder = Words.new(dictionary, words_file, sequences_file)
worder.get_sequences_and_words
writer = Writer.new(worder.sequences, words_file, sequences_file)
writer.write_sequences
writer.write_words
puts "Please check 'lib/words.txt' and 'lib/sequences.txt' for words and sequences."
