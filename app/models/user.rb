class User < ApplicationRecord
  validates_presence_of :username
  validates :email, uniqueness: true, presence: true


  def self.from_omniauth(auth)
    require "pry"; binding.pry
    where(email: auth.info.email).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
    end
  end
end
