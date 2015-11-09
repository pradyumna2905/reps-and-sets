require 'rails_helper'

RSpec.feature "Listing exercises" do
    before do
        @john = User.create(email: "john@example.com", password: "password")
        login_as(@john)

        @e1 = @john.exercises.create(duration_in_min: 20, workout: "Upper body", workout_date: "11-11-2015")
        @e2 = @john.exercises.create(duration_in_min: 30, workout: "Lower body", workout_date: "11-10-2015")
    end

    scenario "Shows user's workouts for last seven days" do
        visit "/"

        click_link "My Lounge"

        expect(page).to have_content(@e1.duration_in_min)
        expect(page).to have_content(@e1.workout)
        expect(page).to have_content(@e1.workout_date)

        expect(page).to have_content(@e2.duration_in_min)
        expect(page).to have_content(@e2.workout)
        expect(page).to have_content(@e2.workout_date)
    end
end
