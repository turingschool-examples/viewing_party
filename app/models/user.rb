class User < ApplicationRecord
  has_many :friends
  has_many :parties
  has_many :guests
end
