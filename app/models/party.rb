class Party < ApplicationRecord
  belongs_to :movie
  belongs_to :host,  class_name: "User",  foreign_key: "user_id"
  has_many :invitees
  has_many :users, through: :invitees

end
