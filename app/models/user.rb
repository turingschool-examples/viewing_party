class User < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :parties

  def self.from_omniauth(auth)
    user = User.find_by(id: auth[:uid]) || User.new
    user.attributes = {
      name: auth[:info][:name],
      email: auth[:info][:email],
      token: auth[:credentials][:token],
      refresh_token: auth[:credentials][:refresh_token],
    }
    user.save!
    user
  end
end
