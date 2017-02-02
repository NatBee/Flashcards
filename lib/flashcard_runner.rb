require_relative './card_class'
require_relative './guess_class'
require_relative './deck_class'
require_relative './round_class'

card_1 = Card.new("What is 5 + 5?", "10")
card_2 = Card.new("What is Rachel's favorite animal?", "panda")
card_3 = Card.new("What is Mike's middle name?", "nobody knows")
card_4 = Card.new("What cardboard cutout lives at Turing?", "Justin Bieber")
deck = Deck.new([card_1, card_2])
round = Round.new(deck)

puts "Welcome! You're playing with 4 cards."
puts "-------------------------------------------------"

deck.cards.each do |cards|
  puts "This is card number #{round.guesses.count + 1} out of #{deck.count}."
  puts "Question: #{round.current_card.question}"
  gets.chomp   # 10
  puts "#{round.response.feedback}"
end
# Correct!
# This is card number 2 out of 4.
# Question: What is Rachel's favorite animal?
# panda
# Incorrect.
# This is card number 3 out of 4.
# Question: What is Mike's middle name?
# nobody knows
# Correct!
# This is card number 4 out of 4.
# Question: What cardboard cutout lives at Turing?
# Justin Bieber
# Correct!
# ****** Game over! ******
# You had 3 correct guesses out of 4 for a score of 75%.
