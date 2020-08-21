require 'rails_helper'

RSpec.describe Friendship do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :friend}
  end

  describe 'instance methods' do
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

      @friendship = Friendship.create(user_id: @user.id, friend_id: @user_2.id)
    end

    it '#create_inverse' do
      inverse = @friendship.create_inverse
      expect(inverse.user_id).to eq(@user_2.id)
      expect(inverse.friend_id).to eq(@user.id)
    end

    it '#destroy_inverse' do
      @friendship.destroy_inverse
      expect(Friendship.all).to eq([])
    end

    it '#inverse_exist?' do
      expect(@friendship.inverse_exist?).to eq(true)
    end

    it '#find_inverse' do
      friendship_2 = Friendship.last
      expect(@friendship.find_inverse.first).to eq(friendship_2)
    end

    it '#inverse_match_options' do
      expect(@friendship.inverse_match_options).to eq({friend_id: @user.id, user_id: @user_2.id})
    end
  end
end
