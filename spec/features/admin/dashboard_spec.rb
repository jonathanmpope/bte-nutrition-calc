require 'rails_helper'

RSpec.describe "Admin Dashboard page" do
  it "allows you to view content if you're an approved admin" do
    visit '/admins/login'

    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    
    username = "funbucket13"
    password = "test"
    email = 'test@test.com'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Login"

    visit '/admins/dashboard'

    expect(page).to have_content("Welcome, #{username}!")
  end
end 