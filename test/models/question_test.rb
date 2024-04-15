require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question1 = questions(:one)
  end

  test "should not save without instrument" do
    question_test = Question.new(description: 'Teste')

    assert_not question_test.valid?
    assert @question1.valid?
  end
end
