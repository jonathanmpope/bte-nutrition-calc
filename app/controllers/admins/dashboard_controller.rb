class Admins::DashboardController < ApplicationController
    before_action :require_logged_in 

    def index
        @admins_pending_approval = Admin.admins_pending_approval
        if params[:search].present?
            @users = Person.search_by_name(params[:search])
        elsif params[:goal] != '' && params[:training_load] == ''
            @users = Person.filter_by_track(params[:goal])
        elsif params[:goal] == '' && params[:training_load] != ''
            @users = Person.filter_by_training_load(params[:training_load])
        elsif params[:goal] != '' && params[:goal] != nil && params[:training_load] != '' && params[:training_load] != nil 
            @users = Person.filter_by_goal_and_training_load(params[:goal], params[:training_load])
        else
            @users = Person.all 
        end
    end 

    private
    def require_logged_in
        if !current_admin
            flash[:error] = "Sorry, you must logged in." 
            redirect_to "/admins/login"
        end 
    end 
end 