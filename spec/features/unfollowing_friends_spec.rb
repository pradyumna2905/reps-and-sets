require 'rails_helper'

RSpec.feature "Unfollowing friends" do
    before do
        @john = User.create(first_name: "John", last_name: "Appleseed", email: "john@example.com", password: "password")
        @eric = User.create(first_name: "Eric", last_name: "Clapton", email: "eric@example.com", password: "password")

        login_as(@john)
        @following = Friendship.create(user: @john, friend: @eric)
    end

    scenario do
        visit "/"

        click_link "My Lounge"
        link = "a[href='/friendships/#{@following.id}'][data-method='delete']"
        find(link).click

        expect(page).to have_content(@eric.full_name + " unfollowed")
    end
end
