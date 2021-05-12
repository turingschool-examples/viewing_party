class User < ApplicationRecord
  has_many :friends, dependent: :destroy
  has_many :parties, foreign_key: :host_id, dependent: :destroy
  has_many :guests, dependent: :destroy
end
