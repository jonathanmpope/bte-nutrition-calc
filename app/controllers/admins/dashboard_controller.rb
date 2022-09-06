class Admins::DashboardController < ApplicationController
    before_action :require_approved 

    def index 
        @admin = Admin.find(session[:admin_id])
        @users = Person.all 
    end 

    private 
    def require_approved
        flash[:error] = "Sorry, you must be a logged in and approved admin." unless current_approved_admin?
    end 
end 