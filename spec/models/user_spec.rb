require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_length_of(:password).is_at_least(8).is_at_most(30)}
    it {should have_secure_password}
  end

  describe "relationships" do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
    it {should have_many :invitations}
    it {should have_many(:parties).through(:invitations)}
  end
end
