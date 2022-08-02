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
                
                expect(phase1.fc_pref_conversion(person)).to eq(0.7)
            end 
        end 

         describe 'total_kcal_calc' do 
            it 'calculates total kcal' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)
                
                expect(phase1.total_kcal_calc(person)).to eq(4035.1199999999994)
            end 
        end

        describe 'fat_calc' do 
            it 'calculates fats' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)
                phase1.total_kcal_calc(person)
                phase1.protein_calc(person)
                phase1.fat_calc(person)
                phase1.carb_calc
                
                expect(phase1.fat_calc(person)).to eq({:fat_grams=>140.0, :fat_cals=>1260.0, :fat_percent=>31.225837149824542})
            end 
        end

        describe 'protein_calc' do 
            it 'calculates protein' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)
                phase1.total_kcal_calc(person)
                phase1.protein_calc(person)
                phase1.fat_calc(person)
                phase1.carb_calc

                expect(phase1.protein_calc(person)).to eq({:protein_grams=>220.00000000000003, :protein_cals=>880.0000000000001, :protein_percent=>21.808521184004448})
            end 
        end

         describe 'carb_calc' do 
            it 'calculates carbs' do 
                person = Person.create!(name:"Bob", email:"boaty@test.com", weight:200, bodycomp:"<10", lean_mass:184.0, goal:"performance", activity_level:"moderate", training_load:"12+", fc_pref:"fats", multiplier:21.929999999999996)
                phase1 = person.phases.create!(name: person.goal)
                phase1.total_kcal_calc(person)
                phase1.protein_calc(person)
                phase1.fat_calc(person)
                phase1.carb_calc

                expect(phase1.carb_calc).to eq({:carb_grams=>473.77999999999986, :carb_cals=>1895.1199999999994, :carb_percent=>46.96564166617101})
            end 
        end
    end 

    describe 'class methods' do 
    end 

end 