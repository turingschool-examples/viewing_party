require 'rails_helper'

describe PartyFriend, type: :model do
  describe "relationships" do
    it { should belong_to :party }
    it { should belong_to :friendship }
  end

  describe "class methods" do
    describe "::make_multiple_friends" do
      it "can make more than one friend for a party" do
        user = User.create(email: 'fun@email.com', password: 'test')
        friend1 = user.friends.create(email: 'a @email.com', password: '123')
        friend2 = user.friends.create(email: 'b@email.com', password: '1234')
        friend3 = user.friends.create(email: 'c@email.com', password: '456')
        movie = Movie.create(api_id: 550)
        party = movie.parties.create(
          movie_id: movie.id,
          movie_title: "FightClub",
          duration: 150,
          date: DateTime.now + 5,
          user_id: user.id
        )

        friends = [friend1.id, friend2.id, friend3.id]
        expected = PartyFriend.make_multiple_friends(friends, party.id, user.id)
        expect(expected.length).to eq(3)
      end
    end
    describe "::find_invited_parties" do
      it "can return the parties a user is invited to based on user_id" do
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

        expect(PartyFriend.find_invited_parties(user2.id)).to eq([party])
        expect(PartyFriend.find_invited_parties(user3.id)).to eq([party])
        expect(PartyFriend.find_invited_parties(user4.id)).to eq([party])
      end
    end
  end
end
