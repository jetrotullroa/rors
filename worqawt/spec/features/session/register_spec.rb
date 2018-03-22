require "rails_helper"

RSpec.feature "Register a new User" do
  scenario do
    visit "/"

    click_link "Register"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Password", with: "passwords"
    fill_in "Confirm Password", with: "passwords"
    click_button "Register"

    expect(page).to have_link("Logout")
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end
end
