class AthletesController < ApplicationController
  def index
    @athletes = User.has_workout.page(params[:page]).per(6)
  end

  def search
    @athletes = User.search_by_name(params[:search_name]).page(params[:page]).per(6)
  end
end
