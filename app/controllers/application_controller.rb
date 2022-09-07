class ApplicationController < ActionController::Base

    helper_method :current_admin

    def current_admin
       @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id] 
    end 

    def current_approved_admin?
        if current_admin && current_admin.not_approved?
            redirect_to '/admins/dashboard'
            flash[:alert] = "You must be an approved admin to view this page!"
        end 
    end 
end
