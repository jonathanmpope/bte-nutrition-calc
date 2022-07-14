require 'rails_helper'

RSpec.describe Person, type: :model do 
    describe 'relationships' do
        it { should belong_to :person }
    end 

    describe 'validations' do 
        it { should validate_presence_of :name }
    end 

    describe 'instance methods' do 
    end 

    describe 'class methods' do 
    end 

end 