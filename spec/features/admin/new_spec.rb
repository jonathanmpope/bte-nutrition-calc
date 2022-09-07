require 'rails_helper'

RSpec.describe "Admin registration form" do
  it "creates new admin" do
    visit '/admins/new'

    username = "funbucket13"
    password = "test"
    email = 'test@test.com'

    fill_in :admin_username, with: username
    fill_in :admin_email, with: email
    fill_in :admin_password, with: password
    fill_in :admin_password_confirmation, with: password

    click_on "Create Admin"

    expect(page).to have_content("Welcome, #{username}!")
  end

  it "will show an error if you're missing something" do
    visit '/admins/new'

    username = "funbucket13"
    password = "test"

    fill_in :admin_username, with: username
    fill_in :admin_password, with: password
    fill_in :admin_password_confirmation, with: password

    click_on "Create Admin"

    expect(page).to have_content("Email can't be blank")
  end

  it "has a link to login" do
    visit '/admins/new'

    expect(page).to have_content("Login")
  end

  it "has a link to logout and to the dashboard" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

    visit '/admins/new'

    expect(page).to have_content("Logout")
    expect(page).to have_content("Dashboard")
  end
end