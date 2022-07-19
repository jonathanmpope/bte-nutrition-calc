class PersonsController < ApplicationController 

    def new 
    end 

    def create 
        person = Person.create(person_params)
        person.multiplier_calc
        # binding.pry 
    end 

    private 
    def person_params
        params.permit(:name, :email, :weight, :bodycomp, :goal, :activity_level, :training_load, :fc_pref )
    end 

end 