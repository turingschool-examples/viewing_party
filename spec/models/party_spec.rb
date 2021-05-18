require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:duration) }
  end

  describe 'relationships' do
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end

  describe 'instance methods' do
    describe '.host' do
      it 'can find the partys host' do
        party = Party.create!(movie_title: 'movie', date: '2021-05-17', start_time: "07:00 PM", duration: 180)

        email = "example@example.com"
        password = "test"
        user = User.create!(email: email, password: password)
        friend = User.create!(email: 'world@email.com', password: "hello")
        other_friend = User.create!(email: 'unicorn@email.com', password: "hi")

        Friendship.create!(user_id: user.id, friend_id: friend.id)
        Friendship.create!(user_id: user.id, friend_id: other_friend.id)

        Attendee.create!(user_id: user.id, party_id: party.id, status: 1)
        Attendee.create!(user_id: friend.id, party_id: party.id, status: 0)
        Attendee.create!(user_id: other_friend.id, party_id: party.id, status: 0)
        
        expect(party.host).to eq(user.email)
      end
    end
  end
end
