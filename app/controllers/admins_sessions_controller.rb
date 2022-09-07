 class AdminsSessionsController < ApplicationController 

    def new
    end 

    def create 
        admin = Admin.find_by(username: params[:username])
        if admin&.authenticate(params[:password])
            session[:admin_id] = admin.id 
            redirect_to "/admins/dashboard" 
            flash[:success] = "Welcome, #{admin.username}"
        else 
            flash[:error] = "Sorry, your credentials are bad"
            render :new
        end 
    end 

    def destroy 
        session.destroy
        redirect_to '/admins/login'
    end 
end 