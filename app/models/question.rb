class Question < ApplicationRecord
  # Associations
  belongs_to :instrument
  has_many :answers, dependent: :destroy
end
