require 'rails_helper'

RSpec.describe Phase, type: :model do 
    describe 'relationships' do
        it { should belong_to :person }
    end 

    describe 'validations' do 
        it { should validate_presence_of :protein_grams }
        it { should validate_presence_of :protein_cals }
        it { should validate_presence_of :protein_percent }
        it { should validate_presence_of :carb_grams }
        it { should validate_presence_of :carb_cals }
        it { should validate_presence_of :carb_percent }
        it { should validate_presence_of :fat_grams }
        it { should validate_presence_of :fat_cals }
        it { should validate_presence_of :fat_percent }
        it { should validate_presence_of :name }
    end 

    describe 'instance methods' do 
    end 

    describe 'class methods' do 
    end 

end 