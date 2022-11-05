class Admins::DashboardController < ApplicationController
    before_action :require_logged_in 

    def index
         @admins_pending_approval = Admin.admins_pending_approval
        if params[:search].present?
            @users = Person.search_by_name(params[:search])
         else
            @users = Person.all 
        end
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must logged in." 
            redirect_to "/admins/login"
        end 
    end 
end 