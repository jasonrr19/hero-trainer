class BookingsController < ApplicationController

  def create
    raise
    @booking = @lesson.booking.new(booking_params)
    @booking.user = current_user

    if @booking.save
      redirect_to lesson_path(@lesson), notice: "Booking Successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:title,:date, :start_time, :price)
  end
end
