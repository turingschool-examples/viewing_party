require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
  end

  describe 'relationships' do
    it { should have_many :friendships }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'instance methods' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      @friend_1 = @user.friends.create!(email: "Todd@example.com", password: "password")
      @friend_2 = @user.friends.create!(email: "Carson@example.com", password: "password")
      @friend_3 = @user.friends.create!(email: "Charlie@example.com", password: "password")
      @party = @user.parties.create!(user_id: @user.id, movie_title: "I am Movie", duration: "1hr 3mins", day: "2020-12-17", start_time: "13:00")
      @guest_1 = Guest.create(party_id: @party.id, user_id: @friend_1.id)
    end

    it '#invited_to' do
      expect(@friend_1.invited_to).to eq([@party])
    end
    it '#all_parties' do
      expect(@party.convert_time).to eq(" 1:00 PM")
    end
  end
end
