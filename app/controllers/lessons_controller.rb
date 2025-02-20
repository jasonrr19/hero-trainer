class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    # raise
    @lessons = Lesson.all
    if params[:query].present?
      @lessons = Lesson.search_by_title(params[:query])
    end
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

end
