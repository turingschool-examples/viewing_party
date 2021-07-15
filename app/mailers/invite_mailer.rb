class InviteMailer < ApplicationMailer
  default from: 'party.viewer.turing@google.com'

  def invite_email
    @host = params[:host]
    @party = params[:party]
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "You've been invited to a movie party!")
  end
end
