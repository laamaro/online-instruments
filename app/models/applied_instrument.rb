class AppliedInstrument < ApplicationRecord
  # Associations
  belongs_to :instrument
  belongs_to :user
  has_many :evaluated_answers, dependent: :destroy

  # Validations
  validates :user_id, uniqueness: { scope: :instrument_id }

  # Callbacks
  after_create :send_user_email_notification

  # Enums
  enum status: {
    pending: 0, # quando o avaliado ainda não respondeu o instrumento
    finished: 1 # instrumento concluído
  }

  private

  def send_user_email_notification
    UserMailer.with(user: user).new_instrument.deliver_now
  end
end
