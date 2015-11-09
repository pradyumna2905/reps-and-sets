require 'rails_helper'

RSpec.feature "Editing exercises" do
    before do
        @owner = User.create(email: "owner@example.com", password: "password")

        @owner_exer = @owner.exercises.create(duration_in_min: 20, workout: "Upper body", workout_date: Date.today)
        login_as(@owner)
    end

    scenario "with valid input succeeds" do
        visit "/"

        click_link "My Lounge"

        link = "a[href='/users/#{@owner.id}/exercises/#{@owner_exer.id}/edit']"
        find(link).click

        fill_in "Duration (min)", with: 70
        click_button "Update"

        expect(page).to have_content("Exercise has successfully been edited")
        expect(page).to have_content(70)
        expect(page).not_to have_content(20)

    end
end
