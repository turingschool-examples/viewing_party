class Party < ApplicationRecord
  belongs_to :user
  has_many :guests
  has_many :users, through: :guests

  def convert_time
    start_time.strftime("%l:%M %P")
  end

  def party_status
      if user_id == user.id
        "Hosting"
      else
        "Invited"
      end
    end
  end
