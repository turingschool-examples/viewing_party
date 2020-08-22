require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of :username}
    it {should validate_presence_of :email}
  end

  describe "relationships" do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
  end

  describe "class methods" do
    it "creates a new user with #from_omniauth" do

    end
  end
end
