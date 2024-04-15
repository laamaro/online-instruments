class Question < ApplicationRecord
  # Associations
  belongs_to :instrument
  has_many :answers, dependent: :destroy

  # Validations
  validates_length_of :answers, maximum: 4
end
