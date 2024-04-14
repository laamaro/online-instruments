class UsersController < ApplicationController
  def index
    @patients = policy_scope(User).where(role: 1)
  end

  def show
    @patient = User.find(params[:id])

    authorize @patient
  end
end
