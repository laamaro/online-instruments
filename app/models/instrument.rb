class Instrument < ApplicationRecord
  has_many :questions, dependent: :destroy
end
