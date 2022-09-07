class Admins::DashboardController < ApplicationController
    before_action :require_logged_in 

    def index
        @users = Person.all 
        @admins_pending_approval = Admin.admins_pending_approval
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must logged in." 
            redirect_to "/admins/login"
        end 
    end 
end 