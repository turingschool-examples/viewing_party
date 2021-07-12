require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
   it { should have_many(:user_friendships) }
   it { should have_many(:friends) }
 end

  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end
end

# RSpec.describe User do
#   describe 'validations' do
#     it {should validate_presence_of(:email)}
#     it {should validate_presence_of(:password_digest)}
#   end
#
#   describe 'relationships' do
#     it {should have_many(:user_friendships)}
#     it {should have_many(:friends).through(:user_friendships)}
