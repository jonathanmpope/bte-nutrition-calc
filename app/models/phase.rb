class Phase < ApplicationRecord
    belongs_to :person
    # validates_presence_of :protein_grams
    # validates_presence_of :protein_cals
    # validates_presence_of :protein_percent
    # validates_presence_of :carb_grams
    # validates_presence_of :carb_cals
    # validates_presence_of :carb_percent
    # validates_presence_of :fat_grams
    # validates_presence_of :fat_cals
    # validates_presence_of :fat_percent
    validates_presence_of :name
   
    def fc_pref_conversion(person)
        person.fc_pref == "fats" ? @fc_pref = 0.7 : nil 
        person.fc_pref == "carbs" ? @fc_pref = 0.5 : nil 
        person.fc_pref == "equal mix" ? @fc_pref = 0.6 : nil 
        protein_calc(person)
        @fc_pref
    end

    def total_kcal_calc(person)
        @phase1_macro_hash = {}
        @phase1_macro_hash[:total_kcal] = (person.lean_mass * person.multiplier)
        fc_pref_conversion(person)
        @phase1_macro_hash
    end 

    def carb_calc
        @phase1_macro_hash[:carb_grams] = ((@phase1_macro_hash[:total_kcal] - (@phase1_macro_hash[:protein_grams] * 4 + @phase1_macro_hash[:fat_grams] * 9)) / 4)
        @phase1_macro_hash[:carb_cals] = (@phase1_macro_hash[:carb_grams] * 4)
        @phase1_macro_hash[:carb_percent] = (@phase1_macro_hash[:carb_cals] / @phase1_macro_hash[:total_kcal] * 100)
    end

    def protein_calc(person)
        @phase1_macro_hash[:protein_grams] = (person.weight * 1.1)
        @phase1_macro_hash[:protein_cals] = (@phase1_macro_hash[:protein_grams] * 4)
        @phase1_macro_hash[:protein_percent] = (@phase1_macro_hash[:protein_cals] / @phase1_macro_hash[:total_kcal] * 100)
        fat_calc(person)
    end

    def fat_calc(person)
        @phase1_macro_hash[:fat_grams] = (person.weight * @fc_pref)
        @phase1_macro_hash[:fat_cals] = (@phase1_macro_hash[:fat_grams] * 9)
        @phase1_macro_hash[:fat_percent] = (@phase1_macro_hash[:fat_cals] / @phase1_macro_hash[:total_kcal] * 100)
        carb_calc
    end
    
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

    def phase2_calcs(person)
        phase2_macro_hash = {}
        phase2_macro_hash[:protein_grams] = person.weight * 1
        phase2_macro_hash[:protein_cals] = (phase2_macro_hash[:protein_grams] * 4)
        phase2_macro_hash[:fat_grams] = person.weight * 1.75
        phase2_macro_hash[:fat_cals] = (phase2_macro_hash[:fat_grams] * 9)
        phase2_macro_hash[:carb_grams] = 50.0
        phase2_macro_hash[:carb_cals] = (phase2_macro_hash[:carb_grams] * 4)
        phase2_macro_hash[:kcal] = (phase2_macro_hash[:carb_grams] * 4) + (phase2_macro_hash[:fat_grams] * 9) + (phase2_macro_hash[:protein_grams] * 4)
        phase2_macro_hash[:protein_percent] = (phase2_macro_hash[:protein_grams] * 4) / phase2_macro_hash[:kcal] * 100
        phase2_macro_hash[:fat_percent] = (phase2_macro_hash[:fat_grams] * 9) / phase2_macro_hash[:kcal] * 100
        phase2_macro_hash[:carb_percent] = (phase2_macro_hash[:carb_grams] * 4) / phase2_macro_hash[:kcal] * 100
        phase2_macro_hash
    end 

    def phase3_calcs_fasting(person)
        phase3_macro_hash_fast = {}
        phase3_macro_hash_fast[:protein_grams] = person.weight * 1.1
        phase3_macro_hash_fast[:protein_cals] = (phase3_macro_hash_fast[:protein_grams] * 4)
        phase3_macro_hash_fast[:fat_grams] = person.weight * 1.25
        phase3_macro_hash_fast[:fat_cals] = (phase3_macro_hash_fast[:fat_grams] * 9)
        phase3_macro_hash_fast[:carb_grams] = person.weight * 0.75
        phase3_macro_hash_fast[:carb_cals] = (phase3_macro_hash_fast[:carb_grams] * 4)
        phase3_macro_hash_fast[:kcal] = (phase3_macro_hash_fast[:carb_grams] * 4) + (phase3_macro_hash_fast[:fat_grams] * 9) + (phase3_macro_hash_fast[:protein_grams] * 4)
        phase3_macro_hash_fast[:protein_percent] = (phase3_macro_hash_fast[:protein_grams] * 4) / phase3_macro_hash_fast[:kcal] * 100
        phase3_macro_hash_fast[:fat_percent] = (phase3_macro_hash_fast[:fat_grams] * 9) / phase3_macro_hash_fast[:kcal] * 100
        phase3_macro_hash_fast[:carb_percent] = (phase3_macro_hash_fast[:carb_grams] * 4) / phase3_macro_hash_fast[:kcal] * 100
        phase3_macro_hash_fast
    end

    def phase3_calcs_nonfasting(person)
        phase3_macro_hash_nonfast = {}
        phase3_macro_hash_nonfast[:protein_grams] = person.weight * 1.1
        phase3_macro_hash_nonfast[:protein_cals] = (phase3_macro_hash_nonfast[:protein_grams] * 4)
        phase3_macro_hash_nonfast[:fat_grams] = person.weight * 0.5
        phase3_macro_hash_nonfast[:fat_cals] = (phase3_macro_hash_nonfast[:fat_grams] * 9)
        phase3_macro_hash_nonfast[:carb_grams] = person.weight * 1.25
        phase3_macro_hash_nonfast[:carb_cals] = (phase3_macro_hash_nonfast[:carb_grams] * 4)
        phase3_macro_hash_nonfast[:kcal] = (phase3_macro_hash_nonfast[:carb_grams] * 4) + (phase3_macro_hash_nonfast[:fat_grams] * 9) + (phase3_macro_hash_nonfast[:protein_grams] * 4)
        phase3_macro_hash_nonfast[:protein_percent] = (phase3_macro_hash_nonfast[:protein_grams] * 4) / phase3_macro_hash_nonfast[:kcal] * 100
        phase3_macro_hash_nonfast[:fat_percent] = (phase3_macro_hash_nonfast[:fat_grams] * 9) / phase3_macro_hash_nonfast[:kcal] * 100
        phase3_macro_hash_nonfast[:carb_percent] = (phase3_macro_hash_nonfast[:carb_grams] * 4) / phase3_macro_hash_nonfast[:kcal] * 100
        phase3_macro_hash_nonfast
    end
end 