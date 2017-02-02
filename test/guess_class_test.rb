gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess_class'
require_relative '../lib/card_class'

class GuessTest < Minitest::Test

  def  test_guess_for_correct_card
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "What is the capital of Alaska?", guess.card.question
    assert_equal "Juneau", guess.card.answer
  end

  def test_if_response_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_can_tell_if_response_is_correct
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert guess.correct?
  end

  def test_it_response_with_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback
  end

  def  test_guess_for_correct_card_2
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal "Which planet is closest to the sun?", guess.card.question

    assert_equal "Mercury", guess.card.answer
  end

  def test_if_response_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    refute_equal "Mercury", guess.response
  end

  def test_if_response_is_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    refute guess.correct?
  end

  def test_it_response_with_feedback_incorrect
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect!", guess.feedback
  end
end
