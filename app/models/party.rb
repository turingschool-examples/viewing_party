class Party < ApplicationRecord
  validates :movie_title, presence: true
  validates :duration, presence: true
  validates :time, presence: true
  validates :date, presence: true

  has_many :attendees, dependent: :destroy
  has_many :users, through: :attendees

  def host
    host_id = attendees.where('status = ?', 0).first.user_id
    User.find(host_id)
  end

  def invited_users
    invited = attendees.where('status = ?', 1)
    invited.map do |atnde|
      User.find(atnde.user_id)
    end
  end
end
