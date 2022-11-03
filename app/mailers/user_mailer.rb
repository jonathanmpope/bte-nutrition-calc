class UserMailer < ApplicationMailer
    # default from: 'team@buildingtheelite.com'

  def welcome_email
    @user = params[:user]
    mail(to: 'team@buildingtheelite.com', subject: "Your BTE Nutrition Calculator Results are in, #{@user.email}")
  end
end
