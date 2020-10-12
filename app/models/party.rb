class Party < ApplicationRecord
  # alias_method :host, :user_id
  # belongs_to :host, class_name: 'User'
  belongs_to :user
  has_many :party_users
  has_many :users, through: :party_user

  validates :movie_title,
            :user_id,
            :date,
            :time, presence: true
end
