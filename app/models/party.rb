class Party < ApplicationRecord
  # alias_method :host, :user_id
  # belongs_to :host, class_name: 'User'

  validates :movie_title,
            :user_id,
            :date,
            :time, presence: true
end
