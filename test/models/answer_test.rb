require "test_helper"

class AnswerTest < ActiveSupport::TestCase
  setup do
    @question1 = questions(:one)
    @question2 = questions(:two)
    @question3 = questions(:three)
  end

  test "should not save if question has already four answers" do
    answer_extra = Answer.new(description: 'E', position: 5, question: @question1)

    assert_not answer_extra.valid?, 'Máximo de quatro respostas por pergunta'
  end

  test "answer position has to bem from 1 to 4" do
    answer_test = Answer.new(description: 'Test', position: 5, question: @question2)

    assert_not answer_test.valid?, 'Posição deve ser 1, 2, 3 ou 4'
  end

  test "should not have the same position for one question" do
    answer_position = Answer.new(description: 'Same Position', position: 2, question: @question2)

    assert_not answer_position.valid?, 'Posição não pode ser repitida para a mesma pergunta'
  end

  test "should apply the right score according to position" do
    answer_score1 = Answer.create(description: 'Get Score 1', position: 1, question: @question3)
    answer_score2 = Answer.create(description: 'Get Score 2', position: 2, question: @question3)
    answer_score3 = Answer.create(description: 'Get Score 3', position: 3, question: @question3)
    answer_score4 = Answer.create(description: 'Get Score 4', position: 4, question: @question3)

    assert_equal 3, answer_score1.score
    assert_equal 2, answer_score2.score
    assert_equal 1, answer_score3.score
    assert_equal 0, answer_score4.score
  end
end
