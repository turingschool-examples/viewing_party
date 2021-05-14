require 'rails_helper'

describe User do
  describe "relationships" do
    it {should have_many :followers}
    it {should have_many :followees}
  end

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password)}
  end
end
