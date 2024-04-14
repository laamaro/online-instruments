class AppliedInstrument < ApplicationRecord
  # Associations
  belongs_to :instrument
  belongs_to :user
  has_many :evaluated_answers, dependent: :destroy

  # Enums
  enum status: {
    pending: 0, # quando o avaliado ainda não respondeu o instrumento
    finished: 1 # instrumento concluído
  }
end
