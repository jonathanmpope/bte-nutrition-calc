require 'rails_helper'

RSpec.describe "Admin login page" do
  it "allows you to login if you're an admin" do
    visit '/admins/login'

    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test" , status: 1)

    username = "funbucket13"
    password = "test"
    email = 'test@test.com'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Login"
    
    expect(page).to have_content("Welcome, #{username}!")
    expect(current_path).to eq("/admins/dashboard")
  end

  it "doesn't allow you to login if you're an admin with bad credentials" do
    visit '/admins/login'

    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test")

    username = "funbucket13"
    password = "test123"
    email = 'test@test.com'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Login"
    
    expect(page).to have_content("Sorry, your credentials are bad")
    expect(current_path).to eq("/admins/login")
  end
end 