class Question < ApplicationRecord
  # Associations
  belongs_to :instrument
  has_many :answers, dependent: :destroy

  # Validations
  validate :maximum_questions

  private

  def maximum_questions
    errors.add(:base, 'Máximo de 5 perguntas por instrumento') if instrument.questions.length >= 5
  end
end
