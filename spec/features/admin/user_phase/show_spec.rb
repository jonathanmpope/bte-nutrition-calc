require 'rails_helper'

RSpec.describe "Admin User Phase Show Page" do
  it "allows you to view a users phase show page" do
    admin = Admin.create!(username:"funbucket13", email: 'test@test.com', password: "test", status: 1)
    person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)

    allow_any_instance_of(ApplicationController).to receive(:current_admin).and_return(admin)

    visit "/#{person.id}/results" 
    visit "/admins/dashboard/#{person.id}/#{person.phases[0].id}"

    expect(page).to have_content("Phase Info")
  end 
end 