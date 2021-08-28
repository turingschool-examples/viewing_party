require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    # it { should belong_to(:) }
    it { should have_many(:friendships) }
    it { should have_many(:attendees) }
    it { should have_many(:watch_parties).through(:attendees) }
    it {should have_many(:watch_parties)}
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password)}
  end

  before :each do

  end

  describe 'class methods' do
   describe '.' do
    end
  end

  describe 'instance methods' do
    describe '#friends' do
      it 'can give a list of all our friends' do
        user1 = create(:user)
        user2 = create(:user)
        user3 = create(:user)

        Friendship.create!(user: user1, friend: user2)
        Friendship.create!(user: user1, friend: user3)

        expect(user1.friends).to eq([user2, user3])
      end
    end
  end
end
