class User < ApplicationRecord
  has_many :authorizations

  def self.update_and_create(name, email)
    User.find_by(email: email) || User.create(name: name, email: email)
  end
end
