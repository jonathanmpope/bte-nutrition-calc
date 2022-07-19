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

    def multiplier_calc
        goal_calc
        activity_level_calc
        training_load_calc
        lean_mass_calc
        @multiplier = @goal_mult * @ac_mult * @tl_mult
        total_kcal_calc
    end 

    def goal_calc
        goal == "performance" ? @goal_mult = 17 : nil 
        goal == "fat loss" ? @goal_mult = 15 : nil 
        goal == "muscle gain" ? @goal_mult = 18 : nil 
        @goal_mult
    end 

    def activity_level_calc 
        activity_level == "low" ? @ac_mult = 1.0 : nil 
        activity_level == "moderate" ? @ac_mult = 1.075 : nil 
        activity_level == "high" ? @ac_mult = 1.15 : nil      
        @ac_mult
    end 

    def training_load_calc 
        training_load == "sub4" ? @tl_mult = 1.0 : nil 
        training_load == "5-8" ? @tl_mult = 1.075 : nil 
        training_load == "9-12" ? @tl_mult = 1.15 : nil 
        training_load == "12+" ? @tl_mult = 1.2 : nil 
        @tl_mult
    end 

    def lean_mass_calc
        bodycomp == "<10" ? lean_mass_mult = 0.92 : nil 
        bodycomp == "10-15" ? lean_mass_mult = 0.875 : nil 
        bodycomp == "16-20" ? lean_mass_mult = 0.825 : nil 
        bodycomp == "20+" ? lean_mass_mult = 0.75 : nil
        # fc_pref_conversion
        @lean_mass = lean_mass_mult * weight
    end

    def fc_pref_conversion
        fc_pref == "fats" ? @fc_pref = 0.7 : nil 
        fc_pref == "carbs" ? @fc_pref = 0.5 : nil 
        fc_pref == "equal mix" ? @fc_pref = 0.6 : nil 
    end

    def total_kcal_calc
        @total_kcal = (@lean_mass * @multiplier)
        update_person(@total_kcal, @lean_mass, @multiplier)
    end 

    def update_person(kcal, lean_mass, multiplier)
        self.update(kcal: kcal, lean_mass: lean_mass, multiplier: multiplier)
    end 

    def calculations
        fc_pref_conversion
        protein_calc
        fat_calc
        carb_calc 
        phase_create
    end 

    def phase_create 
        self.phases.create!(name: goal, protein_grams: @protein[:protein_grams], protein_cals: @protein[:protein_cals], protein_percent: @protein[:protein_percent], carb_grams: @carb[:carb_grams], carb_cals: @carb[:carb_cals], carb_percent: @carb[:carb_percent], fat_grams: @fat[:fat_grams], fat_cals:  @fat[:fat_cals], fat_percent:  @fat[:fat_percent])
    end 
    
    def carb_calc
        @carb = {}
        @carb[:carb_grams] = ((kcal - (@protein[:protein_grams] * 4 + @fat[:fat_grams] * 9)) / 4)
        @carb[:carb_cals] = (@carb[:carb_grams] * 4)
        @carb[:carb_percent] = (@carb[:carb_cals] / kcal * 100)
        @carb
    end

    def protein_calc
        @protein = {}
        @protein[:protein_grams] = (weight * 1.1)
        @protein[:protein_cals] = (@protein[:protein_grams] * 4)
        @protein[:protein_percent] = (@protein[:protein_cals] / kcal * 100)
        @protein 
    end

    def fat_calc
        @fat = {}
        @fat[:fat_grams] = (weight * @fc_pref)
        @fat[:fat_cals] = (@fat[:fat_grams] * 9)
        @fat[:fat_percent] = (@fat[:fat_cals] / kcal * 100)
        @fat 
    end


end