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

end
