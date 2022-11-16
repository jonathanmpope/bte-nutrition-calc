class Admins::Dashboard::UserPhasesController < ApplicationController
    before_action :require_logged_in 

    def show 
        @user = Person.find(params[:person_id])
        @phase = Phase.find(params[:phase_id])
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must logged in." 
            redirect_to "/admins/login"
        end 
    end 
end 