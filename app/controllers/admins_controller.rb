class AdminsController < ApplicationController 

    def new 
        @admin = Admin.new
    end  

    def create
        admin = Admin.new(admin_params)
        if admin.save
            session[:admin_id] = admin.id 
            redirect_to "/admins/dashboard" 
            flash[:success] = "Welcome, #{admin.username}"
        else 
            redirect_to "/admins/new" 
            flash[:error] = admin.errors.full_messages
        end 
    end 

    private 
    def admin_params 
        params.require(:admin).permit(:username, :email, :password)
    end 
end 