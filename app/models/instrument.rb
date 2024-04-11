class Instrument < ApplicationRecord
  # Associations
  has_many :questions, dependent: :destroy
  has_many :applied_instruments, dependent: :destroy
end
