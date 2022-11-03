class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    @person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
    UserMailer.with(user: @person).welcome_email
  end
end