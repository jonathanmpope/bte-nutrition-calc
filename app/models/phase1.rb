class Phase1 < ApplicationRecord
    belongs_to :person
    validates_presence_of :protein_grams
    validates_presence_of :protein_cals
    validates_presence_of :protein_percent
    validates_presence_of :carb_grams
    validates_presence_of :carb_cals
    validates_presence_of :carb_percent
    validates_presence_of :fat_grams
    validates_presence_of :fat_cals
    validates_presence_of :fat_percent
end 