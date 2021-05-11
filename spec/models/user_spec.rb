require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of :email}
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password_digest}
  end

  describe 'relationships' do
    # User - has many friends(other users) through UserFriends, dependent parties, dependent UserFriends
    it {should have_many :user_friends}
    it {should have_many (:friends).through(:user_friends) }
  end
end
