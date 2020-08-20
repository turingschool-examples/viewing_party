class User < ApplicationRecord
  validates :name, :email, :access_token, presence: true
  validates :uid, uniqueness: true, presence: true
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  # has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id', dependent: :destroy
  # has_many :inverse_friends, through: :inverse_friendships, source: :user

  def self.from_omniauth(params)
    user = find_or_create_by(uid: params[:uid])
    user.name = params[:info][:name]
    user.email = params[:info][:email]
    user.access_token = params[:credentials][:token]
    user.save!
    user
  end
end
