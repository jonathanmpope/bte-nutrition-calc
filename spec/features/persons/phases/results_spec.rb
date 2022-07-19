require 'rails_helper'

RSpec.describe 'the results page' do

    it 'should have an empty page ' do
        person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
        
        visit "/#{person.id}/results"
        
        expect(page).to have_content("BTE Nutrition Calculator")
    end  

end 