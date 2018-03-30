class PagesController < ApplicationController

  def index
    @athletes = User.has_workout.last(3).reverse
  end

end
