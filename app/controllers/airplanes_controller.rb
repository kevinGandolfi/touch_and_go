class AirplanesController < ApplicationController
  def index
    @airplanes = Airplane.all
  end

  def show
    @airplanes = Airplane.find(params[:id])
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    if @airplane.save
      redirect_to airplane_path(@airplane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def airplane_params
    params.require(:airplane).permit(:weight, :registration, :number_of_engines, :brand_and_model, :pax_capacity)
  end
end
