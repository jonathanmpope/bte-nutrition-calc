class ApplicationController < ActionController::Base
    
    helper_method :current_admin

    def current_admin 
        Admin.find(session[:admin_id])
    end 

    def current_approved_admin?
        current_admin && current_admin.approved?
    end 

end
