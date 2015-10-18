require 'rails_helper'

RSpec.feature "Signing users up" do

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign Up"

    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")

  end

end
