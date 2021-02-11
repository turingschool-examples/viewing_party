class Friend < ApplicationRecord
  belongs_to :sender, :class_name => "User"

  belongs_to :receiver, :class_name => "User"

  enum request_status: [:approved, :rejected, :pending]

  validates :sender_id, uniqueness: { scope: :receiver_id }
  validates :receiver_id, uniqueness: { scope: :sender_id }
end
