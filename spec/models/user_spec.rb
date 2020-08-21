require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe "relationships" do
    it {should have_many(:friends).through(:friendships)}
  end
end


# class User < ApplicationRecord
# has_many :followers, foreign_key: :follower_id , class_name: "Friendship"
# has_many :followed, through: :followers
# has_many :followed, foreign_key: :followed_id, class_name: "Friendship"
# has_many :followers, through: :followed
# end
