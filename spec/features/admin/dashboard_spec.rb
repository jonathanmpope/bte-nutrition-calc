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

  it "allows you to view content if you're an approved admin" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 0)

    visit '/admins/dashboard'

    expect(page).to have_content("Sorry, you must be a logged in and approved admin.")
  end

  it "has a list of admins pending approval" do
    admin1 = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 0)
    admin2 = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 0)
    admin3 = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 0)

    visit '/admins/login'

    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    
    username = "funbucket13"
    password = "test"
    email = 'test@test.com'

    fill_in :username, with: username
    fill_in :password, with: password

    click_on "Login"

    visit '/admins/dashboard'

    expect(page).to have_content(admin1.username)
    expect(page).to have_content(admin2.username)
    expect(page).to have_content(admin3.username)
  end
end 