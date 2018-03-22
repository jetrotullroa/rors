require "rails_helper"

RSpec.feature "Register a new User" do
  scenario do
    visit "/"

    click_link "Register"
    fill_in "Email", with: "johndoe@example.com"
    fill_in "Password", with: "passwords"
    fill_in "Password Confirmation", with: "passwords"
    click_button "Register"

    expect(page).to_have_content("You have signed up successfully.")
  end
end
