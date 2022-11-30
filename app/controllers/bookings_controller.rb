class BookingsController < ApplicationController
  def create
    @user = current_user
    @airplane = Airplane.find(params[:id])
    @booking = Booking.new(booking_params)

  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day)
  end
end
