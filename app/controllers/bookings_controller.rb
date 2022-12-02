class BookingsController < ApplicationController
  def create
    @airplane = Airplane.find(params[:airplane_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.airplane = @airplane
    if valid_interval?(check_intervals(@booking))
      if @booking.save
        redirect_to airplane_path(@airplane), notice: "Booking successfully saved"
      else
        render "airplanes/show", status: :unprocessable_entity
      end
    else
      flash[:alert] = "Dates not available"
      render "airplanes/show", status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day)
  end

  def check_intervals(booking_airplane)
    airplane = Airplane.find(params[:airplane_id])
    bookings = Booking.where(airplane:)
    check_array = []
    bookings.each do |booking|
      if (booking.start_day..booking.end_day).cover?(booking_airplane.start_day) || (booking.start_day..booking.end_day).cover?(booking_airplane.end_day)
        check_array << false
      else
        check_array << true
      end
    end
    check_array
  end

  def valid_interval?(check_array)
    !check_array.include?(false)
  end
end
