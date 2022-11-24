require 'rails_helper'

RSpec.describe 'the results page' do

    it 'should have a results page for a goal of performance' do
        visit '/'

        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:200)
        # choose(id="sex_male")
        select("Less than 10%", from: "bodycomp")
        select("Moderate", from: "activity_level")
        select("9 to 12 Hours", from: "training_load")
        select("Prefer More Fats", from: "fc_pref")
        select("Performance", from: "goal")
        click_button("Submit")

        expect(page).to have_content("Goal: Performance")
        expect(page).to have_content("Performance Phase Macros")
        expect(page).to have_content("Total calories: 3867")
        expect(page).to have_content("Visual macro breakdown (hover for details)")
        expect(page).to have_content("Macros: 3 Meals Per Day")
        expect(page).to have_content("Macros: 4 Meals Per Day")
        expect(page).to have_content("Macros: 5 Meals Per Day")
        expect(page).to have_button("Keto Phase Macros")
    end  

       it 'should have a results page for a goal of fat loss' do
        visit '/'

        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:200)
        # choose(id="sex_male")
        select("Less than 10%", from: "bodycomp")
        select("Moderate", from: "activity_level")
        select("9 to 12 Hours", from: "training_load")
        select("Prefer More Fats", from: "fc_pref")
        select("Fat Loss", from: "goal")
        click_button("Submit")
        
        expect(page).to have_content("Goal: Fat Loss")
        expect(page).to have_content("Fat Loss Phase Macros")
        expect(page).to have_content("Total calories: 3412")
        expect(page).to have_content("Visual macro breakdown (hover for details)")
        expect(page).to have_content("Macros: 3 Meals Per Day")
        expect(page).to have_content("Macros: 4 Meals Per Day")
        expect(page).to have_content("Macros: 5 Meals Per Day")
        expect(page).to_not have_button("Keto Phase Macros")
    end 
    
    it 'should have a second page when results is selected as the goal' do
        visit '/'

        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:200)
        # choose(id="sex_male")
        select("Less than 10%", from: "bodycomp")
        select("Moderate", from: "activity_level")
        select("9 to 12 Hours", from: "training_load")
        select("Prefer More Fats", from: "fc_pref")
        select("Performance", from: "goal")
        click_button("Submit")

        expect(page).to have_button("Keto Phase Macros")

        click_button("Keto Phase Macros")

        expect(page).to have_content("Keto Phase Macros")
        expect(page).to have_button("IF Phase Macros")

        click_button("IF Phase Macros")

        expect(page).to have_content("IF: Fasting Days Macros")
        expect(page).to have_button("IF Phase - Non Fasting Days Macros")

        click_button("IF Phase - Non Fasting Days Macros")

        expect(page).to have_content("Non-Fasting Days Macros")
    end

end 