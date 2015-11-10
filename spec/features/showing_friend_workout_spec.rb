require "rails_helper"

RSpec.feature "Showing Friend Workout" do
    before do
        @john = User.create(first_name: "John", last_name: "Appleseed", email: "john@example.com", password: "password")
        @eric = User.create(first_name: "Eric", last_name: "Clapton", email: "eric@example.com", password: "password")

        @e1 = @john.exercises.create(duration_in_min: 74, workout: "Weight lifting routine", workout_date: Date.today)
        @e2 = @eric.exercises.create(duration_in_min: 55, workout: "Sarahs weight lifting routine", workout_date: Date.today)
        login_as(@john)
        @following = Friendship.create(user: @john, friend: @eric)
    end

    scenario "shows friend's workout for last 7 days" do
        visit "/"
        click_link "My Lounge"

        click_link @eric.full_name

        expect(page).to have_content(@eric.full_name + "'s Exercises")
        expect(page).to have_content(@e2.workout)
        expect(page).to have_css("div#chart")
    end
end
