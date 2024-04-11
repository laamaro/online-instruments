class EvaluatedAnswer < ApplicationRecord
  # Associations
  belongs_to :answer
  belongs_to :user
end
