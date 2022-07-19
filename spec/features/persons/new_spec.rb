require 'rails_helper'

RSpec.describe 'the person new page' do 
    it 'should have an empty page with lots of forms' do
        visit '/'
        expect(page).to have_content("BTE Nutrition Calculator")
    end  

    it 'should have an empty page with lots of forms' do
        visit '/'

        fill_in("Name", with:"Testy")
        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:180)
        choose(id="sex_male")
        choose(id="bodycomp_10")
        choose(id="activity_level_moderate")
        choose(id="training_load_9-12")
        choose(id="fc_pref_fat")
        choose(id="goal_performance")
        click_button("Submit")

        expect(page).to have_content("BTE Nutrition Calculator")
    end 

end 