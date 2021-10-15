require 'rails_helper'
RSpec.describe Event , type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:runtime) }
  end
  before :each do
  end
  describe 'class methods' do
    describe '.' do
    end
  end
  describe 'instance methods' do
    describe '#host?' do
      # it 'can tell who is hosting the event' do
      #   @user = User.create(email: 'test@test.com', password: 'password123', password_confirmation: 'password123')
      #   @party = @user.events.create(title: 'Harry Potter and The Chamber of Secrets', date: "2021-10-10", time: '8:00:00', runtime: 90, user_id: @user.id)
      #   @user_1 = User.create(email: 'test1@test.com', password: 'password1234', password_confirmation: 'password1234')
      #   @party_1 =  Event.create(title: 'Harry Potter and The Goblet of Fire', date: "2021-10-11", time: '9:00:00', runtime: 120, user_id: @user_1.id)
      #   @friendship = Friendship.create(follower_id:@user.id, followee_id:@user_1.id)
      #   @attendee =  Attendee.create(user_id:@user_1.id, event_id:@party.id)
      #   @attendee_1 = Attendee.create(user_id:@user.id, event_id:@party_1.id)
      #   expect(@party.host?(@user.id)).to eq('hosting')
      #   expect(@party_1.host?(@user.id)).to eq('hosting')
      # end
    end
  end
end
