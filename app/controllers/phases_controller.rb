class PhasesController < ApplicationController 
    include ApplicationHelper
    def show
        @person = Person.find(params[:person_id])
        @phase = Phase.find(params[:id])
    end 

    def create 
        @person = Person.find(params[:person_id])
        if @person.goal == 'performance' 
            performance_phases_creator(@person)
            redirect_to "/#{@person.id}/results/#{@phase1.id}"
        else 
            non_performance_phases_creator(@person)
            redirect_to "/#{@person.id}/results/#{@phase1.id}"
        end
    end 
end 