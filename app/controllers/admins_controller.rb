class AdminsController < ApplicationController 

    def new 
        @admin = Admin.new
    end 
    
    # def show  
    #     @admin = Admin.find(params[:id])
    # end 

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

    def login_form  
    end 

    def login 
        admin = Admin.find_by(username: params[:username])
        if admin.authenticate(params[:password])
            session[:admin_id] = admin.id 
            redirect_to "/admins/dashboard" 
            flash[:success] = "Welcome, #{admin.username}"
        else 
            flash[:error] = "Sorry, your credentials are bad"
            render :login_form
        end 
    end 

    private 
    def admin_params 
        params.require(:admin).permit(:username, :email, :password)
    end 

end 