class Friend < ApplicationRecord
  belongs_to :sender, :class_name => "User"

  belongs_to :receiver, :class_name => "User"

  enum request_status: [:approved, :rejected, :pending]
end
