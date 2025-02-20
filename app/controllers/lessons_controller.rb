class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all
    @markers = @lessons.geocoded.map do |lesson|
      {
        lat: lesson.latitude,
        lng: lesson.longitude
      }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @trainer = @lesson.user
  end

  def new
    @lesson = Lesson.new
    @Lesson.user = current_user
  end

  private
  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration, :address, :price, :capacity)
  end

end
