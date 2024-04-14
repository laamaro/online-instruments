class EvaluatedAnswersController < ApplicationController
  before_action :set_user, only: %i[new create]

  def new
    @evaluated_answer = EvaluatedAnswers.new

    authorize @evaluated_answer
  end

  def create
    @evaluated_answer = EvaluatedAnswers.new(evaluated_answer_params)
    @evaluated_answer.user = @user

    authorize @evaluated_answer

    if @evaluated_answer.save

      # redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def evaluated_answer_params
    params.require(:evaluated_answer).permit(:answer_id)
  end
end
