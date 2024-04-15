class Answer < ApplicationRecord
  # Associations
  belongs_to :question
  has_many :evaluated_answers, dependent: :destroy

  # Validates
  validates :position, uniqueness: { scope: :question_id }
  validates :position, inclusion: { in: [1, 2, 3, 4] }
  validate :maximum_answers

  # Callbacks
  before_validation :set_score

  private

  def maximum_answers
    errors.add(:base, 'Não é possível adicionar mais de 4 resposta à pergunta') if question.answers.length >= 4
  end

  def set_score
    self.score = case position
                 when 1 then 3
                 when 2 then 2
                 when 3 then 1
                 when 4 then 0
                 end
  end
end
