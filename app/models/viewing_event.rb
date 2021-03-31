class ViewingEvent < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :viewers
  has_many :users, through: :viewers
end
