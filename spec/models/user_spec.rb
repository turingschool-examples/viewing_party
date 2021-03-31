require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe "relationships" do
    it { should have_many :parties }
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'instance methods' do
    describe "#invites" do
      it "can invite friends to the viewing party" do
        user = User.create(email: 'fun@email.com', password: 'test')
        user2 = User.create!(email: 'a@email.com', password: '123')
        user3 = User.create!(email: 'b@email.com', password: '1234')
        user4 = User.create!(email: 'c@email.com', password: '456')
        friendship_1 = Friendship.create!(user_id: user.id, friend_id: user2.id)
        friendship_2 = Friendship.create!(user_id: user.id, friend_id: user3.id)
        friendship_3 = Friendship.create!(user_id: user.id, friend_id: user4.id)

        movie = Movie.create!(api_id: 550)
        party = Party.create!({
          movie_id: movie.id,
          movie_title: "FightClub",
          duration: 150,
          date: DateTime.now + 5,
          user_id: user.id}
        )

        pf1 = PartyFriend.create!({friendship_id: friendship_1.id, party_id: party.id})
        pf2 = PartyFriend.create!({friendship_id: friendship_2.id, party_id: party.id})
        pf3 = PartyFriend.create!({friendship_id: friendship_3.id, party_id: party.id})

        expect(user2.invites).to eq([party])
        expect(user3.invites).to eq([party])
        expect(user4.invites).to eq([party])
      end
    end
  end
  describe "class method" do
    describe "::sanitize_email" do
      it "returns email in lowercase format" do
        user = User.create(email:'FUNbuCKET@email.com', password: 'test')

        expect(user.email.downcase).to eq('funbucket@email.com')
      end
    end
  end
end
