require_relative './guess_class'


class Deck
  attr_reader :cards, :count

  def initialize(cards)
    @cards = cards
    @count = cards.count
  end
end
