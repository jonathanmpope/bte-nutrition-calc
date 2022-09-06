require 'rails_helper'

RSpec.describe "Admin registration form" do
  it "creates new admin" do
    visit '/admins/new'

    username = "funbucket13"
    password = "test"
    email = 'test@test.com'

    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Create Admin"

    expect(page).to have_content("Welcome, #{username}!")
  end

  xit "will show an error if you're missing something" do
    visit '/admin/new'

    username = "funbucket13"
    password = "test"

    fill_in :username, with: username
    fill_in :password, with: password
    fill_in :password_confirmation, with: password

    click_on "Create Admin"

    expect(page).to have_content("Welcome, #{username}!")
  end
end