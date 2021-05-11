class User < ApplicationRecord
  has_many :friends
  has_many :parties, foreign_key: :host_id
  has_many :guests
end
