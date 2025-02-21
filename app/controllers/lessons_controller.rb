class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all
    if params[:query].present?
      # talvez mudar para search_by_title apenas
      @lessons = Lesson.search_by_title_and_category(params[:query])
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
