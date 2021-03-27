class Invitee < ApplicationRecord
  belongs_to :party
  belongs_to :user

  def full_name
    user.full_name
  end

  def user?(user_id)
    return "text-weight:bold" if self.user_id == user_id
    "text-weight:normal"
  end

  def self.create_multiple_invitees(friend_ids, party_id)
    if friend_ids != ['']
      friend_ids.each do |friend_id|
        if friend_id != ''
          Invitee.create!(party_id: party_id, user_id: friend_id)
        end
      end
    end
  end

end
