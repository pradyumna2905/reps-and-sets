require 'rails_helper'

RSpec.feature "Creating Homepage" do
  scenario do
    visit "/"

    expect(page).to have_link("Reps & Sets")
    expect(page).to have_link("Home")

    expect(page).to have_content("The Lounge")
  end
end
