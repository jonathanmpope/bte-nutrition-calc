class PersonsController < ApplicationController 

    def new 
    end 

    def create 
        @person = Person.create(person_params)
        if @person.save 
            update
        else 
         redirect_to "/"
         flash[:error] = @person.errors.full_messages
        end 
    end 

    def update
        @person.update(multiplier: @person.multiplier_calc, lean_mass: @person.lean_mass_calc)
        redirect_to "/#{@person.id}/results"
    end

    private 
    def person_params
        params.permit(:name, :email, :weight, :bodycomp, :goal, :activity_level, :training_load, :fc_pref )
    end 

end 