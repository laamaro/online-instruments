class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
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

  def translated_role
    case role.to_sym
    when :psychologist then "Psicólogo"
    when :patient then "Avaliado"
    end
  end

  private

  def requires_info?
    patient?
  end
end
