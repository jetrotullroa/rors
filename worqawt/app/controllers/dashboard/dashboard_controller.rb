class Dashboard::DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    @exercises = Exercise.all.where(user_id: current_user).order(created_at: :desc)
  end
end
