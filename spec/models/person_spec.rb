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
        describe 'mutlipier calc' do 
            it 'does ' do 

            end 
        end 
    end         

    describe 'class methods' do 
    end 

end 