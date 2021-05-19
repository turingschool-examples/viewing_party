class Party < ApplicationRecord
  has_many :party_viewers, dependent: :destroy
  belongs_to :host, class_name: 'User'
  belongs_to :movie

  # validates :party_viewers, presence: true

  def current_user_parties(user)
    binding.pry
    #query select parties where host_id = user.id 
  end
end
