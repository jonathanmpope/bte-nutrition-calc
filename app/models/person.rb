class Person < ApplicationRecord
    has_many :phases
    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :weight
    validates_presence_of :bodycomp
    validates_presence_of :lean_mass
    validates_presence_of :goal
    validates_presence_of :activity_level
    validates_presence_of :training_load
    validates_presence_of :fc_pref
    validates_presence_of :multiplier
    validates_presence_of :kcal
end