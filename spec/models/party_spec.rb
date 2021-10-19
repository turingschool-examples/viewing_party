require "rails_helper"

RSpec.describe Party do
  before :each do
    @user = create(:mock_user)
    @friend_1 = create(:mock_user)
    @friend_2 = create(:mock_user)
    @party = create(:mock_party, movie_title: "Lord of the Rings", movie_id: 1)
    @attendee_host = create(:mock_attendee, party_id: @party.id, user_id: @user.id, status: 0)
    @attendee_1 = create(:mock_attendee, party: @party, user: @friend_1, status: 1)
    @attendee_2 = create(:mock_attendee, party: @party, user: @friend_2, status: 1)
  end
  describe "validations" do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
  end

  describe 'relationships' do
    it { should have_many(:attendees).dependent(:destroy) }
    it { should have_many(:users).through(:attendees) }
  end

  describe 'instance methods' do
    it '#host returns hosting user' do
      expect(@party.host).to eq(@user)
    end

    it '#invited_users returns attendees who are not host' do
      expect(@party.invited_users).to eq([@friend_1, @friend_2])
    end
  end
end
