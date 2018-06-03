#
require 'byebug'

file_path = "text.txt"
WORDS_COUNT = {}
ALL_WORDS = []
file = File.open(file_path, "r") 

file.each_line do |line|
  words = line.split 
  words.each do |word|
    ALL_WORDS << word
    word = word.gsub(/[,()'"]/,'')
    if WORDS_COUNT[word]
      WORDS_COUNT[word] += 1
    else
      WORDS_COUNT[word] = 1
    end
  end
end

puts "Words count: "

WORDS_COUNT.sort {|a,b| a[1] <=> b[1]}.each do |key,value|
  puts "#{key} => #{value}"
end
longest_word = ALL_WORDS.max_by(&:length)
shortest_word = ALL_WORDS.min_by(&:length)

sum_all_words = 0
ALL_WORDS.each do |word|
  sum_all_words += word.length
end

average = sum_all_words.to_i/ALL_WORDS.size
puts "The average length of the words is: " + average.to_s + " letters"

puts "The longest word is: " + longest_word + " - #{longest_word.length} letters"
puts "The shortest word is: " + shortest_word + " - #{shortest_word.length} letters"
