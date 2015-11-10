require 'rails_helper'

RSpec.feature "Following friends" do
    before do
        @john = User.create(first_name: "John", last_name: "Appleseed", email: "john@example.com", password: "password")
        @eric = User.create(first_name: "Eric", last_name: "Clapton", email: "eric@example.com", password: "password")

        login_as(@john)
    end

    scenario "if signed in succeeds" do
        visit "/"

        expect(page).to have_content(@john.full_name)
        expect(page).to have_content(@eric.full_name)

        expect(page).not_to have_link("Follow", :href => "/friendships?friend_id#{@john.id}")

        link = "a[href='/friendships?friend_id=#{@eric.id}']"
        find(link).click

        expect(page).not_to have_link("Follow", :href => "friendships?friend_id#{@eric.id}")
    end
end
