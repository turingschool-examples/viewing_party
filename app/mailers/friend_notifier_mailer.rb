class FriendNotifierMailer < ApplicationMailer
  def send_invites(info)
    @users = info[:guests]
    @recipients = return_recipients(@users)
    @viewing = info[:viewing]
    @host = @users.select { |u| u[:hosting] }.first[:user]
    mail(
      reply_to: @host.email,
      to: @recipients.join(', '),
      subject: "#{@host.username} is sending you viewing party details"
    )
  end

  def return_recipients(users)
    users.map do |user|
      user[:user].email unless user[:hosting]
    end
  end
end
