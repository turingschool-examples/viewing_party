require 'rails_helper'

describe User, type: :model do
  describe "relationships" do
    it { should have_many :guests }
    it { should have_many(:parties).through(:guests) }
  end

  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :password }
  end
end
