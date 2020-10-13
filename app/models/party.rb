class Party < ApplicationRecord
  validates :title, :api_id, :runtime, :datetime_of_party, :user_id, presence: true

  belongs_to :user
  has_many :guests, dependent: :destroy
end
