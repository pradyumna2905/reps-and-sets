require 'rails_helper'

RSpec.feature "Listing members" do
    before do
        @john = User.create(first_name: "John", last_name: "Appleseed", email: "johnappleseed@example.com", password: "password")
        @eric = User.create(first_name: "Eric", last_name: "Clapton", email: "eric@example.com", password: "password")
    end

    scenario "shows a list of registered members" do
        visit "/"

        expect(page).to have_content("Members")
        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@eric.full_name)
    end
end
