class UserMailer < ApplicationMailer
  default from: 'notification.viewingparty@gmail.com'

  def sign_up_email
    @user = params[:user]

    mail(to: @user.email, subject: "Thanks for Signing Up!")
  end
end
