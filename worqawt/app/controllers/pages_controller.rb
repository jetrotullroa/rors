class PagesController < ApplicationController

  def index
    @athletes = User.all
  end

end
