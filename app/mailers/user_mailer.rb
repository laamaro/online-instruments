class UserMailer < ApplicationMailer
  def new_instrument
    @user = params[:user]
    mail(to: @user.email, subject: 'Novo Instrumento Disponível')
  end
end
