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

  scenario "with invalid credentials" do
    visit "/"

    click_link "Sign Up"
    fill_in "First Name", with: ""
    fill_in "Last Name", with: ""
    fill_in "Email", with: "john@example.com"
    fill_in "Password", with: "password"
    fill_in "Confirm Password", with: "password"

    click_button "Sign up"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
  end

end
