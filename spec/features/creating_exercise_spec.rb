require 'rails_helper'

RSpec.feature 'Creating Exercise' do
    before do
       @john = User.create(email: "john@example.com", password: "password")
       login_as(@john)
    end

    scenario 'with valid inputs' do
        visit "/"

        click_link "My Lounge"
        click_link "New Workout"

        expect(page).to have_link("Back")

        fill_in "Duration (min)", with: 70
        fill_in "Workout Details", with: "Upper body"
        fill_in "Activity Date", with: Date.today

        click_button "Create Exercise"

        expect(page).to have_content("Hooray! Your exercise has successfully been added to your lounge")

        exercise = Exercise.last
        expect(page.current_path).to eq(user_exercise_path(@john, exercise))
    end

    scenario 'with invalid inputs' do
        visit "/"

        click_link "My Lounge"
        click_link "New Workout"

        expect(page).to have_link("Back")

        fill_in "Duration (min)", with: nil
        fill_in "Workout Details", with: ""
        fill_in "Activity Date", with: ""

        click_button "Create Exercise"

        expect(page).to have_content("Oops! The exercise cannot be created")

        expect(page).to have_content("Duration cannot be blank")
        expect(page).to have_content("Duration is not valid")
        expect(page).to have_content("Workout cannot be blank")
        expect(page).to have_content("Workout date cannot be blank")
    end
end
