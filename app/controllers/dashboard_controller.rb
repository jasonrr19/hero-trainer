class DashboardController < ApplicationController
  def dashboard
    @bookings = Booking.where(user: current_user.id)
  end
end
