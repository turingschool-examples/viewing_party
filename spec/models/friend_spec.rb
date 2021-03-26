require 'rails_helper'

describe Friend, type: :model do
  describe 'relationships' do
    it {should belong_to(:follower).class_name('User')}
    it {should belong_to(:followed).class_name('User')}
  end

  describe 'validations' do
    it "user cannot add themself as a friend" do
      user = User.create!(email: 'myself@email.com', password: 'memyselfandI')
      friend = Friend.new(follower_id: user.id, followed_id: user.id)

      expect(friend.save).to eq(false)
      expect(friend.errors[:followed_id].to_sentence).to eq('You cannot add yourself as a friend.')
    end
  end
end
