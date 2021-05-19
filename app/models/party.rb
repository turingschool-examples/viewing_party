class Party < ApplicationRecord
  has_many :party_viewers, dependent: :destroy
  belongs_to :host, class_name: 'User'
  belongs_to :movie

  # validates :party_viewers, presence: true 
end
