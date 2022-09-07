require 'rails_helper'

RSpec.describe "Admin Dashboard page" do
  it "allows you to view content if you're an approved admin" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

    visit '/admins/dashboard'

    expect(page).to have_content("Welcome, funbucket13!")
  end

  it "will tell you that you need to log in" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 0)

    visit '/admins/dashboard'

    expect(page).to have_content("Sorry, you must logged in.")
    expect(current_path).to eq("/admins/login")
  end

  it "has links to logout and to view user data and admins pending approval" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

    visit '/admins/dashboard'

    expect(page).to have_content("Logout")
    expect(page).to have_content("User Data")
    expect(page).to have_content("Pending Admins")
  end
end 