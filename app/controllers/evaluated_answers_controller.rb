class EvaluatedAnswersController < ApplicationController
  before_action :set_applied_instrument, only: %i[new create]

  def new
    @evaluated_answer = EvaluatedAnswer.new

    authorize @evaluated_answer
  end

  def create
    @evaluated_answer = EvaluatedAnswer.new(evaluated_answer_params)
    @evaluated_answer.applied_instrument = @applied_instrument
    @evaluated_answer.user = @applied_instrument.user

    authorize @evaluated_answer

    respond_to do |format|
      if @evaluated_answer.save

        format.html { redirect_to @applied_instrument }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_applied_instrument
    @applied_instrument = AppliedInstrument.find(params[:applied_instrument_id])
  end

  def evaluated_answer_params
    params.require(:evaluated_answer).permit(:answer_id)
  end
end
