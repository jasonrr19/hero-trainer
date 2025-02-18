class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all

    if params[:category]
      raise
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration, :capacity, :price)
  end
end
