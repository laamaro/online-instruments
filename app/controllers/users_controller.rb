class UsersController < ApplicationController
  def index
    @patients = policy_scope(User).where(role: 1)
  end

  def profile
    @patient = User.find(params[:id])

    authorize @patient
  end
end
