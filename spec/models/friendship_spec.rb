require 'rails_helper'

RSpec.describe Friendship do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :friend}
  end

  describe 'class methods' do
    before :each do
      params = {
        uid: '123',
        info: {name: 'Joe', email: 'joe@me.com'},
        credentials: {token: 'access'}
      }
      @user = User.from_omniauth(params)

      params_2 = {
        uid: '456',
        info: {name: 'Bob', email: 'bob@me.com'},
        credentials: {token: 'more_access'}
      }
      @user_2 = User.from_omniauth(params_2)
    end

    it '.create_mutual_friendship' do
      Friendship.create_mutual_friendship(@user.id, @user_2.id)
      friendship_1 = Friendship.first
      friendship_2 = Friendship.last

      expect(friendship_1.user_id).to eq(@user.id)
      expect(friendship_1.friend_id).to eq(@user_2.id)
      expect(friendship_2.user_id).to eq(@user_2.id)
      expect(friendship_2.friend_id).to eq(@user.id)
    end
  end
end
