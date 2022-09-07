class Admins::DashboardController < ApplicationController
    # before_action :require_approved 
    before_action :require_logged_in 

    def index
        @users = Person.all 
        @admins_pending_approval = Admin.admins_pending_approval
    end 

    private 
    # def require_approved
    #     flash[:error] = "Sorry, you must be a logged in and approved admin to view all content." unless current_approved_admin?
    # end 

    def require_logged_in
        flash[:error] = "Sorry, you must logged in." unless current_admin
        redirect_to '/admins/login'
    end 
end 