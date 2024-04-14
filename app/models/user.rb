class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :applied_instruments, dependent: :destroy
  has_many :evaluated_answers, dependent: :destroy

  # Validations
  validates :birth_date, presence: true, if: -> { requires_info? }
  validates :registration_number, presence: true, if: -> { requires_info? }

  # Enums
  enum role: {
    psychologist: 0, # usuário psicólogo
    patient: 1 # paciente avaliado
  }

  private

  def requires_info?
    patient?
  end
end
