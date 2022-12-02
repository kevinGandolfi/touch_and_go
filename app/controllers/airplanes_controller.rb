class AirplanesController < ApplicationController
  before_action :set_airplane, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: :index

  def index
    @airplanes = Airplane.all
    @markers = @airplanes.geocoded.map do |airplane|
      {
        lat: airplane.latitude,
        lng: airplane.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @marker = [ {lng: @airplane.longitude, lat: @airplane.latitude} ]
  end

  def new
    @airplane = Airplane.new
  end

  def create
    @airplane = Airplane.new(airplane_params)
    @airplane.user = current_user
    if @airplane.save
      attach_photos
      redirect_to airplane_path(@airplane)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @airplane.update(airplane_params)
      attach_photos
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
    params.require(:airplane).permit(:weight, :registration, :number_of_engines, :brand_and_model, :pax_capacity, :speed, :range, :max_altitude, :address)
  end

  def set_airplane
    @airplane = Airplane.find(params[:id])
  end

  def attach_photos
    # :photos were consciously removed from airplane_params and attachments are handled explicitly.
    # The default behavior as of Rails 7 is to replace existing attachments on update while we want
    # to keep existing files and append new photos if any.
    #
    # Workaround as per
    # https://stackoverflow.com/questions/71990425/rails-active-storage-keep-existing-files-uploads
    @airplane.photos.attach(params[:airplane][:photos]) if params.dig(:airplane, :photos).present?
  end
end
