class AdminsController < ApplicationController 

    def index 
        @admin = Admin.find(params[:id])
    end 
    
    def new 
        @admin = Admin.new
    end 

    def create
        admin = Admin.new(admin_params)
        if admin.save
            redirect_to "/admins/#{admin.id}" 
        else 
            redirect_to "/admins/new" 
            flash[:error] = admin.errors.full_messages
        end 
    end 

    private 
    def admin_params 
        params.permit(:username, :email, :password)
    end 

end 