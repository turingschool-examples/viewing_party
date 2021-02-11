class User < ApplicationRecord
  attr_accessor :password_confirmation
  has_secure_password

  validates :email, uniqueness: true, presence:true
  validates :password, presence: true

  # has_many :senders, foreign_key: :sender_id, class_name: "Friend"
  # has_many :approved_senders, -> { where request_status: 0 }, class_name: 'Friend'
  # has_many :approved_sent_friends, :through => :approved_senders, class_name: 'User', :source => :receiver
  # # has_many :sent_friends, through: :senders, source: :receiver

  # has_many :receivers, foreign_key: :receiver_id, class_name: "Friend"
  # # has_many :senders, through: :receivers

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  validates :password_confirmation, presence: true
  validates_confirmation_of :password

  # scope :approved, -> { joins(:senders, :receivers).where(friends) }

  def find_accepted_friends
    require 'pry'; binding.pry
    # User.joins(:senders, :receivers).where("friends.request_status = 0 AND (friends.sender_id = #{id} OR friends.receiver_id = #{id})").uniq
  end
end
