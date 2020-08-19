class User < ApplicationRecord
  validates_presence_of :name, :email, :access_token
  validates :uid, uniqueness: true, presence: true
end
