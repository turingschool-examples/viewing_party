require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_uniqueness_of(:email)}
    it { should validate_presence_of(:password)}
  end

  describe "relationships" do
    it { should have_many :parties }
    it { should have_many :followed_users }
    it { should have_many(:followees).through(:followed_users)}
    it { should have_many :following_users}
    it { should have_many(:followers).through(:following_users)}
    it { should have_many :guest_lists}
  end
end