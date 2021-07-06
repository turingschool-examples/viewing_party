class User < ApplicationRecord

  has_secure_password

  has_many :frienders, foreign_key: :friender_id, class_name: 'Friend', dependent: :destroy
  has_many :friendees, foreign_key: :friendee_id, class_name: 'Friend', dependent: :destroy

  has_many :friendees, through: :frienders
  has_many :frienders, through: :friendees

  has_many :attendees, dependent: :destroy, dependent: :destroy
  has_many :viewing_parties, through: :attendees
  has_many :viewing_parties, dependent: :destroy
  
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password_digest, require: true

end
