require 'rails_helper'

RSpec.describe 'the person new page' do 
    it 'should have an empty page with lots of forms' do
        visit '/'
        save_and_open_page
        expect(page).to have_content("BTE Nutrition Calculator")
    end  

end 