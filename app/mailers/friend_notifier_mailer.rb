class FriendNotifierMailer < ApplicationMailer
  def send_invites(info)
    @users = info[:guests]
    @recipients = @users.map do |user|
      if !user[:hosting]
        user[:user].email
      end
    end

    @viewing = info[:viewing]
    @host = @users.select { |u| u[:hosting] }.first[:user]

    mail(
        reply_to: @host.email,
        to: @recipients.join(', '),
        subject: "#{@host.username} has invited you to watch #{@viewing.movie.title}"
    )
  end
end
