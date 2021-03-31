require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :friend }
  end

  describe 'validations' do
    it { should validate_presence_of :friend_id }
  end

  describe '::class methods' do
    describe '.find_friendships(user, friends_ids)' do
      it "returns the friendship table ids of correlating friendships" do
        user = User.create(email: "joeb@email.com", password: "test")
        user2 = User.create(email: "a@a.com", password: "test")
        user3 = User.create(email: "b@b.com", password: "test")
        user4 = User.create(email: "c@c.com", password: "test")

        friendship_1 = Friendship.create(user_id: user.id, friend_id: user2.id)
        friendship_2 = Friendship.create(user_id: user.id, friend_id: user3.id)
        friendship_3 = Friendship.create(user_id: user.id, friend_id: user4.id)

        expect(Friendship.find_friendships(user.id, [user2.id, user3.id, user4.id])).to eq([friendship_1.id, friendship_2.id, friendship_3.id])
      end
    end
  end
end
