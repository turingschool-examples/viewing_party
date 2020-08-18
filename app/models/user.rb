class User < ApplicationRecord
  validates_presence_of :name,
                        :email,
                        :user_name
end
