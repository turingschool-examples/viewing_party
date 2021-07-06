class User < ApplicationRecord
  validates :email, :password_digest, presence: true

  belongs_to :friendship
  has_many :friendships

end
