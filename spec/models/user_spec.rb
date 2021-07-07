require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
  end

  describe "relationships" do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
    it {should have_many :invitations}
    it {should have_many(:parties).through(:invitations)}
  end
end
