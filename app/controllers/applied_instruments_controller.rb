class AppliedInstrumentsController < ApplicationController
  before_action :set_applied_instrument, only: %i[show]
  before_action :set_patient, only: %i[index new create]

  def index
    @applied_instruments = policy_scope(AppliedInstrument)
  end

  def show; end

  def new
    @applied_instrument = AppliedInstrument.new

    authorize @applied_instrument
  end

  def create
    @applied_instrument = AppliedInstrument.new(applied_instrument_params)
    @applied_instrument.user = @patient
    @applied_instrument.status = 'pending'

    authorize @applied_instrument

    if @applied_instrument.save
      redirect_to @applied_instrument
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def update
  #   respond_to do |format|
  #     if @applied_instrument.update(applied_instrument_params)
  #       format.html { redirect_to @applied_instrument }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @applied_instrument.destroy

  #   respond_to do |format|
  #     format.html { redirect_to applied_instruments_path }
  #   end
  # end

  private

  def applied_instrument_params
    params.require(:applied_instrument).permit(:instrument_id)
  end

  def set_applied_instrument
    @applied_instrument = AppliedInstrument.find(params[:id])

    authorize @applied_instrument
  end

  def set_patient
    @profile = User.find(params[:profile_id])
  end
end
