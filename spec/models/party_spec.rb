require 'rails_helper'

describe Party, type: :model do

  describe 'relations' do
    it { should belong_to :user }
    it { should have_many :guests }
    it { should have_many(:users).through(:guests) }
  end

  describe 'instance methods' do
    before :each do
      @user = User.create!(email: "John@example.com", password: "password")
      @friend_1 = @user.friends.create!(email: "Todd@example.com", password: "password")
      @friend_2 = @user.friends.create!(email: "Carson@example.com", password: "password")
      @friend_3 = @user.friends.create!(email: "Charlie@example.com", password: "password")
      @party = @user.parties.create!(user_id: 342, movie_title: "I am Movie", duration: "1hr 3mins", day: "2020-12-17", start_time: "13:00")

    end

    it '#convert_date' do
      expect(@party.convert_date).to eq("12/17/2020")
    end

    it '#convert_time' do
      expect(@party.convert_time).to eq(" 1:00 PM")
    end
  end
end
