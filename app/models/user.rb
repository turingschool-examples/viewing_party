class User < ApplicationRecord
  validates :name, :email, :access_token, presence: true
  validates :uid, uniqueness: true, presence: true

  def self.from_omniauth(params)
    user = find_or_create_by(uid: params[:uid])
    user.name = params[:info][:name]
    user.email = params[:info][:email]
    user.access_token = params[:credentials][:token]
    user.save!
    user
  end
end
