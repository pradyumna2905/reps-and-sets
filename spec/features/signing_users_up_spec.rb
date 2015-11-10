require 'rails_helper'

RSpec.feature "Signing users up" do

  scenario "with valid credentials" do
    visit "/"

    click_link "Sign Up"
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Appleseed"
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"

    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
    visit "/"

    expect(page).to have_content("John Appleseed")

  end

end
