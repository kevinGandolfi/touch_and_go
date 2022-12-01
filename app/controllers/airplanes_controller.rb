class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @airplanes = Airplane.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.user = current_user
    if @airplane.save
      redirect_to airplane_path(@airplane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @airplane.update(airplane_params)
      redirect_to airplane_path(@airplane)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @airplane.destroy
    redirect_to airplanes_path, status: :see_other
  end

  def search
    @airplanes = Airplane.search_by_brand_and_model(params[:brand])
    render :index
  end

  private

  def airplane_params
    params.require(:airplane).permit(:weight, :registration, :number_of_engines, :brand_and_model, :pax_capacity, :speed, :range, :max_altitude, photos: [])
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end
end
