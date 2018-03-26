require 'rails_helper'

RSpec.configure do |c|
  c.include Dashboard::ExerciseHelper
end

RSpec.feature "new Exercise" do
  before do
    @john = User.create!(email: "john@example.com", password: "password")
    login_as(@john)
  end

  scenario do
    visit "/"

    click_link "Dashboard"
    click_link "New Workout"
    expect(page).to have_link("Back")

    fill_in "Duration", with: 70
    select("Weight Lifting", from: "exercise_workout")
    fill_in "Workout Date", with: "2018/02/28"
    click_button "Create Workout"

    exercise = Exercise.last

    expect(current_path).to eq(dashboard_root_path)
    expect(page).to have_content("Exercise has been completed.")

    expect(exercise.user_id).to eq(@john.id)
    expect(page).to have_content("#{exercise.duration} mins")
    expect(page).to have_content("#{exercise.workout}")
    expect(page).to have_content("#{format_workout_date(exercise.workout_date)}")
  end

  scenario do
    visit "/"

    click_link "Dashboard"
    click_link "New Workout"
    click_button "Create Workout"

    expect(current_path).to eq(dashboard_exercises_path)
    expect(page).to have_content("Workout cannot be saved. Please see 3 errors below")
    expect(page).to have_content("Duration is not a number")
    expect(page).to have_content("Workout can't be blank")
    expect(page).to have_content("Workout date can't be blank")
  end
end
