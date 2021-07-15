require 'rails_helper'

RSpec.describe PartyGuest, type: :model do
  describe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:guest) }
  end

  describe "#instance methods" do 
  before(:each) do
    @movie = VCR.use_cassette("movie_details_by_id") do
      MovieFacade.movie_details_by_id(337404)
    end
    @user = create(:mock_user)
    @friend = create(:mock_user)
    @friend_2 = create(:mock_user)
    @party = create(:mock_party, host_id: @user.id, movie_id: @movie.id, title: @movie.title)
    @party_guests = create(:mock_party_guest, party_id: @party.id, guest: @friend )
    @party_guests_2 = create(:mock_party_guest, party_id: @party.id, guest: @friend_2 )
  end

  describe "#party_guests_emails" do 
    it "returns all party guests" do
      
      expect(@party.party_guests.guest_emails).to eq([])
    end
  end
end

end
