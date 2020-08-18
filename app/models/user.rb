class User < ApplicationRecord

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first_or_create do |user|
      user.username = auth.info.name
      user.email = auth.info.email
    end
  end
end
