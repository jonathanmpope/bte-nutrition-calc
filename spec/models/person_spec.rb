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
                expect(person.training_load_calc).to eq(1.2)
            end 
        end 

        describe 'lean_mass_calc' do 
            it 'calculates lean mass' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.lean_mass_calc).to eq(184.0)
            end 
        end 

         describe 'fc_pref_conversion' do 
            it 'turns fat or carb preference into a multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.fc_pref_conversion).to eq(0.7)
            end 
        end 

         describe 'total_kcal_calc' do 
            it 'calculates total kcal' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                person.lean_mass_calc
                person.multiplier_calc
                expect(person.total_kcal_calc).to eq(4035.1199999999994)
            end 
        end

        describe 'multiplier_calc' do 
            it 'creates a multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64, kcal:3294.33)
                expect(person.multiplier_calc).to eq(21.929999999999996)
            end 
        end

        describe 'phase_create' do 
            it 'creates a phase' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996, kcal:4035.1199999999994)
                person.calculations 
                expect(person.phases[0].class).to eq(Phase)
            end 
        end

         describe 'fat_calc' do 
            it 'calculates fats' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996, kcal:4035.1199999999994)
                person.fc_pref_conversion
                expect(person.fat_calc).to eq({:fat_grams=>140.0, :fat_cals=>1260.0, :fat_percent=>31.225837149824542})
            end 
        end

        describe 'protein_calc' do 
            it 'calculates protein' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996, kcal:4035.1199999999994)
                person.fc_pref_conversion
                expect(person.protein_calc).to eq({:protein_grams=>220.00000000000003, :protein_cals=>880.0000000000001, :protein_percent=>21.808521184004448})
            end 
        end

         describe 'carb_calc' do 
            it 'calculates carbs' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996, kcal:4035.1199999999994)
                person.fc_pref_conversion
                person.fat_calc
                person.protein_calc
                expect(person.carb_calc).to eq({:carb_grams=>473.77999999999986, :carb_cals=>1895.1199999999994, :carb_percent=>46.96564166617101})
            end 
        end
    end         

    describe 'class methods' do 
    end 

end 