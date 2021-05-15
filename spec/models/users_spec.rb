require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password_digest }
  end

  describe "relationships" do
    it { should have_and_belong_to_many :friends }
    it { should have_many :parties }
  end
end
