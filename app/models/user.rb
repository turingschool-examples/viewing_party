class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence:true
  validates :password, presence: true

  has_many :senders, foreign_key: :sender_id, class_name: "Friend"
  has_many :receivers, through: :senders

  has_many :receivers, foreign_key: :receiver_id, class_name: "Friend"
  has_many :senders, through: :receivers
end
