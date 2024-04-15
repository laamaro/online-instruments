class UsersController < ApplicationController
  def index
    @patients = policy_scope(User).where(role: 1)
  end

  def profile
    @patient = User.find(params[:id])

    authorize @patient
  end

  def check_info
    authorize User
  end

  def checked
    if current_user.first_name == params[:first_name] &&
       current_user.last_name == params[:last_name] &&
       current_user.email == params[:email] && current_user.birth_date == params[:birth_date].to_date &&
       current_user.registration_number == params[:registration_number]

      redirect_to profile_path(current_user)
    else
      render :check_info, notice: 'Entre com o perfil correto!'
    end

    authorize current_user
  end
end
