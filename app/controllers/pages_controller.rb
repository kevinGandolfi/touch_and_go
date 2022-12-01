class PagesController < ApplicationController
  def dashboard
    @airplanes_user = Airplane.where(user_id: current_user)
    @bookings = Booking.where(user_id: current_user)
  end
end
