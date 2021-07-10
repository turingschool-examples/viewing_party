class ViewingParty < ApplicationRecord
  # belongs_to :party_host, class_name: 'User'
  belongs_to :party_host, class_name: :User, foreign_key: :party_host_id
  has_many :attendees, dependent: :destroy
end
