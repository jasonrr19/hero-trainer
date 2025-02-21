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

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to trainer_bookings_path, notice: "Lesson made!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration, :address, :price, :capacity)
  end

end
