class UserMailer < ApplicationMailer

  def results_email
    @user = params[:user] 
    mail(to: @user.email, subject: "Your BTE Nutrition Calculator Results")
  end
end
