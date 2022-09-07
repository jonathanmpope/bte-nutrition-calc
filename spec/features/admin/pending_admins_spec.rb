require 'rails_helper'

RSpec.describe "Pending Admins page" do

    it "has a link to the dashboard or to logout if you're already logged in" do
        admin1 = Admin.create!(username:"funbucket132", email: 'test1@test.com', password: "test", status: 0)
        admin2 = Admin.create!(username:"funbucket133", email: 'test2@test.com', password: "test", status: 0)
        admin3 = Admin.create!(username:"funbucket134", email: 'test3@test.com', password: "test", status: 0)
        admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
        
        allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
        
        visit '/admins/pending_admins'
         
        expect(page).to have_content(admin1.username)
        expect(page).to have_content(admin2.username)
        expect(page).to have_content(admin3.username)
  end 
end