require 'rails_helper'

RSpec.describe Admin, type: :model do 
    describe 'relationships' do
    
    end 

    describe 'validations' do 
        it { should validate_presence_of :username }
        it { should validate_presence_of :email }
        it { should validate_presence_of :password }
        it { should have_secure_password }
    end 

end 