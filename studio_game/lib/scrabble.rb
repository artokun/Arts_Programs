#scrabble for the word excellently
letters = {"c"=>3,"e"=>1,"l"=>1,"n"=>1,"t"=>1,"x"=>8,"y"=>4}
puts "Array of letters for 'excellently'"
puts letters
score = 0
#break down all the score of the whole word, should equal 23
"excellently".each_char{|c| score += letters[c]}
puts score
#makes a breakdown of the score for each letter
points_total = Hash.new(0)
"excellently".each_char { |c| points_total[c] += letters[c]}
puts "Breakdown of each letter's values in 'excellently"
puts points_total
points_each = points_total.values.reduce(0, :+)
puts points_each
#should equal 23. this way allows you to break down before totaling
