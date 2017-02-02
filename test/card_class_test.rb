gem 'minitest', '~> 5.0'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card_class'

class CardTest < Minitest::Test
  def test_question_1
    card = Card.new("What is the capital of Colorado?", "Denver")

    assert_equal "What is the capital of Colorado?", card.question
  end

  def test_answer_1
    card = Card.new("What is the capital of Colorado?", "Denver")

    assert_equal "Denver", card.answer
  end

  def test_answer_can_be_wrong
    card = Card.new("answer_1", "wrong")

    assert_equal "wrong", card.answer
  end
end
