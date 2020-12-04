class Guest < ApplicationRecord
  belongs_to :viewing
  belongs_to :user

  validates :user_id, :viewing_id, presence: true
end
