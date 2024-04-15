require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  setup do
    @question1 = questions(:one)
    @instrument = instruments(:one)
  end

  test "should not save if instrument has already five questions" do
    question_extra = Question.new(description: 'Teste2', instrument: @instrument)

    assert_not question_extra.valid?, 'Max of five questions for instrument'
  end
end
