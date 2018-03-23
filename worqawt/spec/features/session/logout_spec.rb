require 'rails_helper'

RSpec.feature "User logout" do
  before do
    john = User.create!(email: "john@example.com", password: "password")
    visit "/users/sign_in"

    fill_in "Email", with: john.email
    fill_in "Password", with: john.password
    click_button "Login"
  end

  scenario do
    expect(page).to have_link("Logout")

    click_link "Logout"
    expect(page).to have_link("Register")
    expect(page).to have_link("Login")
    expect(page).to have_content("Signed out successfully.")
  end
end
