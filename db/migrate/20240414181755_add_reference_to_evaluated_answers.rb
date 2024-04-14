class AddReferenceToEvaluatedAnswers < ActiveRecord::Migration[7.0]
  def change
    add_reference :evaluated_answers, :applied_instrument, foreign_key: true
  end
end
