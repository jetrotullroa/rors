require 'rails_helper'

RSpec.features "Edit a workout" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)

    # SETUP WORKOUT
    click_link "Dashboard"
    click_link "New Workout"
    fill_in "Duration", with: 70
    select("Weight Lifting", from: "exercise_workout")
    click_button "Create Workout"
  end

  scenario do
    visit "/"

    click_link "Dashboard"
    
  end
end
