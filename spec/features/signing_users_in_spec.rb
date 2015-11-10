require 'rails_helper'

RSpec.feature "Users Sign in" do
  before do
    @john = User.create(first_name: "John", last_name: "Appleseed", email: "jogn@example.com", password: "password")
  end

  scenario "Sign in with valid credentials" do
    visit "/"

    click_link "Sign In"

    fill_in "Email", with: @john.email
    fill_in "Password", with: @john.password

    click_button "Log in"

    expect(page).to have_content("Signed in successfully")
    expect(page).to have_content("Signed in as #{@john.email}")
  end
end
