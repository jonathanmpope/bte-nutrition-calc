class Phase < ApplicationRecord
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
    validates_presence_of :name

    def macros_per_meal_3
        three_meals = {}
        three_meals[:protein_grams] = (protein_grams / 3.0)
        three_meals[:carb_grams] = (carb_grams / 3.0)
        three_meals[:fat_grams] = (fat_grams / 3.0)
        three_meals
    end
    
    def macros_per_meal_4
        four_meals = {}
        four_meals[:protein_grams] = (protein_grams / 4.0)
        four_meals[:carb_grams] = (carb_grams / 4.0)
        four_meals[:fat_grams] = (fat_grams / 4.0)
        four_meals
    end

   def macros_per_meal_5
        five_meals = {}
        five_meals[:protein_grams] = (protein_grams / 5.0)
        five_meals[:carb_grams] = (carb_grams / 5.0)
        five_meals[:fat_grams] = (fat_grams / 5.0)
        five_meals
    end
end 