class Admin < ApplicationRecord
    enum status: [:not_approved, :approved]

    validates_presence_of :username, uniqueness: true
    validates_presence_of :email

    has_secure_password 
end 