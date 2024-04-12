class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show] # edit update destroy

  def index
    @instruments = policy_scope(Instrument)
  end

  def show; end

  # def new
  #   @instrument = Instrument.new
  # end

  # def edit; end

  # def create
  #   @instrument = Instrument.new(instrument_params)
  #   @instrument.user = current_user

  #   if @instrument.save
  #     redirect_to @instrument
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  # def update
  #   respond_to do |format|
  #     if @instrument.update(instrument_params)
  #       format.html { redirect_to @instrument }
  #     else
  #       format.html { render :edit, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # def destroy
  #   @instrument.destroy

  #   respond_to do |format|
  #     format.html { redirect_to instruments_path }
  #   end
  # end

  private

  def instrument_params
    params.require(:instrument).permit(:title)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])

    authorize @instrument
  end
end
