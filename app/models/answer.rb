class Answer < ApplicationRecord
  # Associations
  belongs_to :question
  has_many :evaluated_answers, dependent: :destroy
end
