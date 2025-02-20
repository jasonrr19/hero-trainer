class BookingsController < ApplicationController

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new(booking_params)
    @booking.lesson = @lesson
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_path, notice: "Booking requested"
    else
      render :new, status: :unprocessable_entity
    end
    # a
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :participants)
  end
end
