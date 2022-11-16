class UserMailer < ApplicationMailer
    # default from: 'team@buildingtheelite.com'

  def results_email
    @user = params[:user] 
    mail(to: @user.email, subject: "Your BTE Nutrition Calculator Results")
  end
end
