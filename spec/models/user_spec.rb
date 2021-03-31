require 'rails_helper'

describe User, type: :model do
  describe "Validations" do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_uniqueness_of(:email).on(:create)}
  end

  describe 'relationships' do
    it {should have_many(:followed).through(:followed_users)}
    it {should have_many(:followers).through(:following_users)}
    it {should have_many(:viewers)}
    it {should have_many(:viewing_events)}
  end

  describe "email format" do
    it "create a user with a valid email format" do
      user = User.create!(email: 'harrison@email.com', password: 'password')

      expect(user.email).to eq('harrison@email.com')
    end

    it "should not create a user with a invalid email format" do
      user = User.new(email: 'harrison', password: 'password')

      expect(user.save).to eq(false)
    end
  end
end
