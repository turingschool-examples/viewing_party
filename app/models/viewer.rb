class Viewer < ApplicationRecord
  belongs_to :user
  belongs_to :viewing_event

  def self.create_event_viewers(friends, event_id)
    friends.each do |friend|
      Viewer.create!(user_id: friend, viewing_event_id: event_id)
    end
  end
end
