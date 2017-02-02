require 'pry'
require_relative './deck_class'

class Round
  attr_reader :deck, :guesses

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @deck.cards.shift
  end

  def record_guess(guess)
    guesses << Guess.new(guess, current_card)
    guesses.last
  end

  def number_correct
    correct = 0
    guesses.each do |guess|
        if guess.correct?
          correct += 1
        end
    end
    correct
  end

  def percent_correct
    ((number_correct.to_f / guesses.count) * 100).to_i
  end
end
