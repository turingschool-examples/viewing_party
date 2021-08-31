class WatchPartyMailer < ApplicationMailer
  default from: 'test@test.com'

  def welcome(user)
    mail(to: user.email,
         bcc: ["bcc@example.com", "Order Watcher <watcher@example.com>"])
  end
end
