gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/round_class'

class RoundTest < Minitest::Test

  def test_is_the_deck_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Deck, round.deck
  end

  def test_is_guesses_empty_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_current_card_in_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_is_the_round_guess_record_correct
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    guess = Guess.new("Juneau", card_1)

    assert_instance_of Guess, round.record_guess("Juneau")
  end

    def test_what_is_the_round_guess_count
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")

      assert_equal 1, round.guesses.count
    end

    def test_is_the_round_guess_correct?
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")

      assert_equal "Correct!", round.guesses.first.feedback
    end

    def test_what_is_the_round_number_of_correct_guesses
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")

      assert_equal 1, round.number_correct
    end

    def test_current_card_in_round_2
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)

      assert_equal card_1, round.current_card
      assert_equal card_2, round.current_card
    end

    def test_is_the_round_guess_record_correct_2
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      guess = Guess.new("Juneau", card_1)
      guess = Guess.new("2", card_2)

      assert_instance_of Guess, round.record_guess("2")
    end

    def test_what_is_the_round_guess_count_card_2
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      round.record_guess("2")

      assert_equal 2, round.guesses.count
    end

    def test_is_the_round_guess_incorrect
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      guess = Guess.new("Juneau", card_1)
      round.record_guess("Juneau")
      round.record_guess("2")

      assert_equal "Incorrect!", round.guesses.last.feedback
    end

    def test_what_is_the_round_number_of_correct_guesses
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      round.record_guess("2")

      assert_equal 1, round.number_correct
    end

    def test_the_percentage_of_correct_guesses
      card_1 = Card.new("What is the capital of Alaska?", "Juneau")
      card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
      deck = Deck.new([card_1, card_2])
      round = Round.new(deck)
      round.record_guess("Juneau")
      round.record_guess("2")

      assert_equal 50, round.percent_correct
    end
end
