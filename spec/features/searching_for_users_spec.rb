require 'rails_helper'

RSpec.feature "Searching members" do
    before do
        @john = User.create(first_name: "John", last_name: "Appleseed", email: "johnappleseed@example.com", password: "password")
        @eric = User.create(first_name: "Eric", last_name: "Appleseed", email: "eric@example.com", password: "password")
    end

    scenario "With existing names returns all those users" do
        visit "/"

        fill_in "search_name", with: "Appleseed"
        click_button "Search"

        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@eric.full_name)

        expect(current_path).to eq("/dashboard/search")
    end

end
