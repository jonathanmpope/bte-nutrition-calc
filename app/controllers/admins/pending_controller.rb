class Admins::PendingController < ApplicationController
    before_action :require_logged_in,  :require_approved
    # before_action :require_approved 
    
    def index
        @admins_pending_approval = Admin.admins_pending_approval
    end 

    private 
    def require_approved
        if !current_admin.approved?
            flash[:error] = "Sorry, you must be an approved admin to view all content." 
            redirect_to "/admins/dashboard"
        end 
    end 

    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must logged in." 
            redirect_to "/admins/login"
        end 
    end 
end