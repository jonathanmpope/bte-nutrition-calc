class Admins::DashboardController < ApplicationController
    before_action :require_approved 

    def index
        current_admin
        @users = Person.all 
        @admins_pending_approval = Admin.admins_pending_approval
    end 

    private 
    def require_approved
        flash[:error] = "Sorry, you must be a logged in and approved admin." unless current_approved_admin?
    end 
end 