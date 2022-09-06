require 'rails_helper'

RSpec.describe 'the results page' do

    it 'should have a results page for a goal of performance' do
        person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
        
        visit "/#{person.id}/results"

        expect(page).to have_content("BTE Nutrition Calculator")
        expect(page).to have_content("Goal: Performance")
        expect(page).to have_content("Performance Phase Macros")
        expect(page).to have_content("Total calories: 2326")
        expect(page).to have_content("Visual macro breakdown (hover for details)")
        expect(page).to have_content("Macros: 3 Meals Per Day")
        expect(page).to have_content("Macros: 4 Meals Per Day")
        expect(page).to have_content("Macros: 5 Meals Per Day")
        expect(page).to have_button("Keto Phase Macros")
    end  

       it 'should have a results page for a goal of fat loss' do
        person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"fat loss", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
        
        visit "/#{person.id}/results"
        
        expect(page).to have_content("BTE Nutrition Calculator")
        expect(page).to have_content("Goal: Fat Loss")
        expect(page).to have_content("Fat Loss Phase Macros")
        expect(page).to have_content("Total calories: 2326")
        expect(page).to have_content("Visual macro breakdown (hover for details)")
        expect(page).to have_content("Macros: 3 Meals Per Day")
        expect(page).to have_content("Macros: 4 Meals Per Day")
        expect(page).to have_content("Macros: 5 Meals Per Day")
        expect(page).to_not have_button("Keto Phase Macros")
    end  

end 