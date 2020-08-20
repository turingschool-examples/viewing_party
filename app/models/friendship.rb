class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  after_create :create_inverse, unless: :inverse_exist?
  after_destroy :destroy_inverse, if: :inverse_exist?

  def create_inverse
    self.class.create(inverse_match_options)
  end

  def destroy_inverse
    find_inverse.destroy_all
  end

  def inverse_exist?
    self.class.exists?(inverse_match_options)
  end

  def find_inverse
    self.class.where(inverse_match_options)
  end

  def inverse_match_options
    { friend_id: user_id, user_id: friend_id }
  end
end
