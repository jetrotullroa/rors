class PagesController < ApplicationController

  def index
    @athletes = User.has_workout
  end

end
