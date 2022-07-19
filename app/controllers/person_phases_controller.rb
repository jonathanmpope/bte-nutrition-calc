class PersonPhasesController < ApplicationController 
    
    def create
        @person = Person.find(params[:person_id])
        @person.calculations
    end 

end 