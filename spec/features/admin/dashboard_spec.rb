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

  it "has user data" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    
    visit "/#{person.id}/results" 
    visit '/admins/dashboard'
     
    expect(page).to have_content("boaty@test.com")
    expect(page).to have_content(200)
    expect(page).to have_content("<10")
    expect(page).to have_content(184.0)
    expect(page).to have_content("performance")
    expect(page).to have_content("12+")
  end

  it 'lists partial matches as search results' do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person1 = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person2 = Person.create!(email:"bambi@test.com", weight:190, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person3 = Person.create!(email:"scooty@test.com", weight:280, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    
    visit "/#{person1.id}/results" 
    visit "/#{person2.id}/results" 
    visit "/#{person3.id}/results" 
    visit '/admins/dashboard'

    fill_in 'Search', with: "Ba"
    click_on("Search")

    expect(page).to have_content(person2.email)
    expect(page).to_not have_content(person1.email)
    expect(page).to_not have_content(person3.email)
  end

  it 'allows you to filter by goal' do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person1 = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person2 = Person.create!(email:"bambi@test.com", weight:190, bodycomp:"<10", lean_mass:184.0, goal:"fat loss", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person3 = Person.create!(email:"scooty@test.com", weight:280, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    
    visit "/#{person1.id}/results" 
    visit "/#{person2.id}/results" 
    visit "/#{person3.id}/results" 
    visit '/admins/dashboard'

    select("Performance", from: "goal")
    click_on("Filter")

    expect(page).to_not have_content(person2.email)
    expect(page).to have_content(person1.email)
    expect(page).to have_content(person3.email)
  end

  it 'allows you to filter by activity level' do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person1 = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"5-8", fc_pref:"fats", multiplier:12.64)
    person2 = Person.create!(email:"bambi@test.com", weight:190, bodycomp:"<10", lean_mass:184.0, goal:"fat loss", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person3 = Person.create!(email:"scooty@test.com", weight:280, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    
    visit "/#{person1.id}/results" 
    visit "/#{person2.id}/results" 
    visit "/#{person3.id}/results" 
    visit '/admins/dashboard'

    select("12+ Hours", from: "training_load")
    click_on("Filter")

    expect(page).to have_content(person2.email)
    expect(page).to_not have_content(person1.email)
    expect(page).to have_content(person3.email)
  end

  it 'allows you to filter by goal and activity level' do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person1 = Person.create!(email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"5-8", fc_pref:"fats", multiplier:12.64)
    person2 = Person.create!(email:"bambi@test.com", weight:190, bodycomp:"<10", lean_mass:184.0, goal:"fat loss", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    person3 = Person.create!(email:"scooty@test.com", weight:280, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    
    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)
    
    visit "/#{person1.id}/results" 
    visit "/#{person2.id}/results" 
    visit "/#{person3.id}/results" 
    visit '/admins/dashboard'
    
    select("Performance", from: "goal")
    select("12+ Hours", from: "training_load")
    click_on("Filter")

    expect(page).to_not have_content(person2.email)
    expect(page).to_not have_content(person1.email)
    expect(page).to have_content(person3.email)
  end
end 