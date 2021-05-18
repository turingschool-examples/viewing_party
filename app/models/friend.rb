class Friend < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :friend, class_name: 'User'

  validates :friend, uniqueness: { scope: :user }
end
