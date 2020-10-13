class Party < ApplicationRecord
  validates_presence_of :title, :api_id, :runtime, :datetime_of_party, :user_id

  belongs_to :user
  has_many :guests
end
