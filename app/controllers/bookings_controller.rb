class BookingsController < ApplicationController
  def create
    @airplane = Airplane.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.airplane = @airplane
    if @booking.save
      redirect_to airplane_path(@airplane)
    else
      render :show, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day)
  end
end
