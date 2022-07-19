require 'rails_helper'

RSpec.describe Person, type: :model do 
    describe 'relationships' do
        it { should have_many :phases }
    end 

    describe 'validations' do 
        it { should validate_presence_of :name }
        it { should validate_presence_of :email }
        it { should validate_presence_of :weight }
        it { should validate_presence_of :bodycomp }
        it { should validate_presence_of :lean_mass }
        it { should validate_presence_of :goal }
        it { should validate_presence_of :activity_level }
        it { should validate_presence_of :training_load }
        it { should validate_presence_of :fc_pref }
        it { should validate_presence_of :multiplier }
        it { should validate_presence_of :kcal }
    end 

    describe 'instance methods' do 
        describe 'goal calc' do 
            it 'turns a goal in a goal multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.goal_calc).to eq(17)
            end 
        end
        
        describe 'activity_level_calc' do 
            it 'turns a activity level into an al multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.activity_level_calc).to eq(1.075)
            end 
        end 

        describe 'training_load_calc ' do 
            it 'turns training load into a tl multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.training_load_calc ).to eq(1.2)
            end 
        end 

        describe 'lean_mass_calc' do 
            it 'calculates lean mass' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.lean_mass_calc ).to eq(184.0)
            end 
        end 
    end         

    describe 'class methods' do 
    end 

end 