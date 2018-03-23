require 'rails_helper'

RSpec.feature "new Exercise" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario do
    visit "/"

    click_link "Dashboard"
    click_button "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    fill_in "Workout Details", with: "Weight Lifting"
    click_button "Create Exercise"

    exercise = Exercise.last

    expect(current_path).to eq(dashboard_path(@john, exercise))
    expect(page).to have_content("Exercise has been completed.")

    expect(exercise.user_id).to eq(@john.id)
    expect(page).to have_content("#{exercise.duration}")
    expect(page).to have_content("#{exercise.workout}")
    expect(page).to have_content("#{exercise.created_at}")

  end
end
