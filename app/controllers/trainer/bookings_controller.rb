class Trainer::BookingsController < ApplicationController
  def index
    @lessons = Lesson.where(user: current_user)
    @user = User.where(user:current_user)
  end
end
