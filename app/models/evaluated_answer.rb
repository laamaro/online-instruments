class EvaluatedAnswer < ApplicationRecord
  # Associations
  belongs_to :answer
  belongs_to :user
  belongs_to :applied_instrument
end
