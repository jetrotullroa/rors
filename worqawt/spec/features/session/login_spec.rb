require "rails_helper"

RSpec.feature "User Login" do
  before do
    @john = User.create!(email: "john@example.com", password: "password", first_name: "John", last_name: "Doe")
  end

  scenario do
    visit "/"

    click_link "Login"
    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password
    click_button "Login"

    expect(page).to have_link("Logout")
    expect(page).to have_link("John Doe")
    expect(page).to have_content("Signed in successfully.")
  end
end
