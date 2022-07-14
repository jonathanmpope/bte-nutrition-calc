# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Phase1.destroy_all 
Person.destroy_all

Person1 = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"< 10%", lean_mass:184.0, goal:"Performance", activity_level:"4-6 hours", training_load:"10-15 hours", fc_pref:"fats", multiplier:12.64, kcal:3294)