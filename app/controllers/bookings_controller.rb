class BookingsController < ApplicationController

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new(booking_params)
    @booking.lesson = @lesson
    @booking.user = current_user
    raise
    if @booking.save
      redirect_to lesson_path(@lesson), notice: "Booking Successful!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :participants)
  end
end
