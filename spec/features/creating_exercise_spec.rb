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
        fill_in "Activity Date", with: "2015-30-10"
        
        click_button "Create Exercise"
        
        expect(page).to have_content("Hooray! Your exercise has successfully been added to your lounge")
        
        exercise = Exercise.last
        expect(page.current_path).to eq(user_exercise_path(@john, exercise)) 
    end
end