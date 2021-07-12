class Party < ApplicationRecord
  # belongs_to :users
  belongs_to :party_host, class_name: 'User', foreign_key: :party_host_id
  has_many :attendees, dependent: :destroy

  # validates :party_host_id
end
