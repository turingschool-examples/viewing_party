require 'rails_helper'

RSpec.describe ViewParty, type: :model do
  describe 'validations' do
    it {should validate_presence_of :movie_title}
    it {should validate_presence_of :date}
    it {should validate_presence_of :time}
    it {should validate_presence_of :runtime}
  end
  describe 'relationships' do
    it {should have_many :user_view_parties}
    it {should have_many(:users).through(:user_view_parties)}
  end
  describe 'instance methods' do
    before :each do
      @user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      @party = @user.view_parties.create!(date: "2020-08-30", movie_title: "Speed", runtime: "90", time: "19:30")
    end
    it 'can create start_time' do
      expect(@party.start_time).to eq("2020-08-30T19:30:00-06:00")
    end
    it 'can create end_time' do
      expect(@party.end_time).to eq("2020-08-30T21:00:00-06:00")
      @party.runtime = 300
      expect(@party.end_time).to eq("2020-08-31T00:30:00-06:00")
    end
  end
end
