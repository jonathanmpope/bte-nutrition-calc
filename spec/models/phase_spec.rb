require 'rails_helper'

RSpec.describe Phase, type: :model do 
    describe 'relationships' do
        it { should belong_to :person }
    end 

    describe 'validations' do 
        # it { should validate_presence_of :protein_grams }
        # it { should validate_presence_of :protein_cals }
        # it { should validate_presence_of :protein_percent }
        # it { should validate_presence_of :carb_grams }
        # it { should validate_presence_of :carb_cals }
        # it { should validate_presence_of :carb_percent }
        # it { should validate_presence_of :fat_grams }
        # it { should validate_presence_of :fat_cals }
        # it { should validate_presence_of :fat_percent }
        it { should validate_presence_of :name }
    end 

    describe 'instance methods' do 
        describe 'fc_pref_conversion' do 
            it 'turns fat or carb preference into a multiplier' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:12.64)
                phase1 = person.phases.create!(name: person.goal)
                phase1.total_kcal_calc(person)

                expect(phase1.fc_pref_conversion(person)).to eq(0.7)
            end 
        end 

         describe 'total_kcal_calc' do 
            it 'calculates total kcal' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)

                expect(phase1.total_kcal_calc(person)[:total_kcal]).to eq(4035.1199999999994)
            end 
        end

        describe 'fat_calc' do 
            it 'calculates fats' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)
                
                expect(phase1.total_kcal_calc(person)[:fat_cals]).to eq(1260.0)
                expect(phase1.total_kcal_calc(person)[:fat_grams]).to eq(140.0)
                expect(phase1.total_kcal_calc(person)[:fat_percent]).to eq(31.225837149824542)
            end 
        end

        describe 'protein_calc' do 
            it 'calculates protein' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)

                expect(phase1.total_kcal_calc(person)[:protein_cals]).to eq(880.0000000000001)
                expect(phase1.total_kcal_calc(person)[:protein_grams]).to eq(220.00000000000003)
                expect(phase1.total_kcal_calc(person)[:protein_percent]).to eq(21.808521184004448)
            end 
        end

         describe 'carb_calc' do 
            it 'calculates carbs' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)

                expect(phase1.total_kcal_calc(person)[:carb_cals]).to eq(1895.1199999999994)
                expect(phase1.total_kcal_calc(person)[:carb_grams]).to eq(473.77999999999986)
                expect(phase1.total_kcal_calc(person)[:carb_percent]).to eq(46.96564166617101)
            end 
        end
    end 

    describe 'class methods' do 
    end 

end 