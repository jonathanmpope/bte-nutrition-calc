require 'rails_helper'

RSpec.describe 'the results page' do

    it 'should have an empty page ' do
        visit '/results'
        expect(page).to have_content("BTE Nutrition Calculator")
    end  

end 