class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties, foreign_key: :host_id, dependent: :destroy, inverse_of: :user
  has_many :invitations, foreign_key: :invitee_id, dependent: :destroy, inverse_of: :user
  has_many :parties, through: :invitations
end
