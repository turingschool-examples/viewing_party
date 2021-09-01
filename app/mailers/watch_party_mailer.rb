class WatchPartyMailer < ApplicationMailer
  default from: 'test@test.com'

  def user_ids(watch_party)
    ids = []
    watch_party.attendees.each do |user|
      ids << user.user_id unless user.user_id == watch_party.user_id
    end
    watch_party_users(ids)
  end

  def watch_party_users(ids)
    users = User.where(id: ids)
    watch_party_emails(users)
  end

  def watch_party_emails(users)
    users.map { |user| user.email }
  end

  def viewing_party_invitation(watch_party)
    mail(to: user_ids(watch_party),
         bcc: ["You are Invited!"],
         body: email_body(watch_party))
  end

  def email_body(watch_party)
    "You are invited to view #{watch_party.movie} on #{watch_party.date.strftime('%a, %b %e')} at #{watch_party.start_time.strftime('%I:%M %P')}"
  end
end
