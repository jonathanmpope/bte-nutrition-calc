class PersonPhasesController < ApplicationController 
    
    def create
        @person1 = Person.find(params[:person_id])
        @person1.calculations
        @phase1 = @person1.phases[0]
        # Phase.where("person_id = ?", @person1.id)
    end 

end 