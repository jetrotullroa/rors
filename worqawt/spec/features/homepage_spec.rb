require "rails_helper"

RSpec.feature "Visit Homepage" do
  scenario do
    visit '/'

    expect(page).to have_link('worQawt')
    expect(page).to have_content('Workout Lounge!')
    expect(page).to have_content('Show off your workout.')
  end
end
