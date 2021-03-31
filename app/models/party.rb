class Party < ApplicationRecord
  belongs_to :user
  has_many :guest_lists
end
