class AthletesController < ApplicationController
  def index
    @athletes = User.has_workout.page(params[:page]).per(6)
  end
end
