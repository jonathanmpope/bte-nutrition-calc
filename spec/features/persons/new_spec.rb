require 'rails_helper'

RSpec.describe 'the person new page' do 
    it 'should have an empty page with lots of forms' do
        visit '/'
        expect(page).to have_content("BTE Nutrition Calculator")
    end  

    it 'should have forms you can fill out' do
        visit '/'

        fill_in("Name", with:"Testy")
        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:180)
        choose(id="sex_male")
        select("Less than 10%", from: "bodycomp")
        select("Moderate", from: "activity_level")
        select("9 to 12 Hours", from: "training_load")
        select("Prefer More Fats", from: "fc_pref")
        select("Performance", from: "goal")

        # choose(id="bodycomp_10")
        # choose(id="activity_level_moderate")
        # choose(id="training_load_9-12")
        # choose(id="fc_pref_fats")
        # choose(id="goal_performance")
        click_button("Submit")
         save_and_open_page

        expect(page).to have_content("Testy")
    end 

    it 'should not allow you to submit a form with an empty area' do
        visit '/'

        fill_in("Name", with:"Testy")
        fill_in("Email", with:"test@test.com")
        fill_in("Weight", with:180)
        choose(id="sex_male")
        select("Less than 10%", from: "body_comp")
        choose(id="activity_level_moderate")
        choose(id="training_load_9-12")
        choose(id="fc_pref_fats")
        click_button("Submit")

        expect(current_path).to eq('/')
    end

end 