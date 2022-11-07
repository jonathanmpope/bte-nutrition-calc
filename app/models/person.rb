class Person < ApplicationRecord
    has_many :phases
    validates_presence_of :name
    validates_presence_of :email
    validates_presence_of :weight
    validates_presence_of :bodycomp
    # validates_presence_of :lean_mass
    validates_presence_of :goal
    validates_presence_of :activity_level
    validates_presence_of :training_load
    validates_presence_of :fc_pref
    # validates_presence_of :multiplier
    # validates_presence_of :kcal

    def multiplier_calc
        goal_calc
        activity_level_calc
        training_load_calc
        lean_mass_calc
        @multiplier = @goal_mult * @ac_mult * @tl_mult
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
        @lean_mass = lean_mass_mult * weight
    end

    def self.search_by_name(name)
        where("name ILIKE ?", "%#{name}%")
    end 

    def self.filter_by_track(track)
        binding.pry 
        where(goal: track)
    end 

    def self.filter_by_activity_level(activity_level)
        where(activity_level: activity_level)
    end 

    def self.filter_by_goal_and_activity_level(goal, activity_level)
        where(goal: track).where(activity_level: activity_level)
    end 
end