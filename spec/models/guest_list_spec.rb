require 'rails_helper'

RSpec.describe GuestList, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :party }
  end
  describe "class methods" do
    describe "::make_guest_list" do
      it "returns an array of GuestList objects created using the ids_collection and the party_id" do
        user = User.create(email: "sample@email.com", password: "124")
        invitee_1 = User.create(email: "sample1@email.com", password: "2343")
        invitee_2 = User.create(email: "sample2@email.com", password: "hello")
        invitee_3 = User.create(email: "sample3@email.com", password: "23hello")
        party = Party.create(user_id: user.id, duration: 180, movie_id: "550", date: "05/05/2025", time: "07:30 PM")
        id_collection = [invitee_1.id, invitee_2.id, invitee_3.id]
        expect(GuestList.make_guest_list(id_collection, party.id).length).to eq(3)
        expect(GuestList.make_guest_list(id_collection, party.id).first.user_id).to eq(invitee_1.id)
        expect(GuestList.make_guest_list(id_collection, party.id).second.user_id).to eq(invitee_2.id)
        expect(GuestList.make_guest_list(id_collection, party.id).third.user_id).to eq(invitee_3.id)
      end
    end
  end
end