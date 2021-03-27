require 'rails_helper'

RSpec.describe Party, type: :model do
  before :each do
    @user = User.create!(name: "name", email: "email@gmail.com", password: "password")
  @movie1 = Movie.create(name: 'The Godfather', duration: 175)
  @party1 = Party.create!(movie_id: @movie1.id, duration: @movie1.duration, date: "2021/03/29", start_time: "6:00 PM", host_id: @user.id)
  end

  describe "relationships" do
    it { should belong_to :host }
    it { should belong_to :movie }
    it { should have_many :party_friends }
    it { should have_many(:users).through(:party_friends) }
  end

  describe "validations" do
    it { should validate_presence_of :host }
    it { should validate_presence_of :movie }
    it { should validate_presence_of :date }
    it { should validate_presence_of :start_time }
  end

  describe "instance methods" do
    describe "#find_movie" do
      it "can find the movie name" do
      expect(@party1.find_movie).to eq("The Godfather")
      end
    end

    describe "#clean_date" do
      it "can get a date with just year, month, and day" do
        expect(@party1.clean_date).to eq("March 29th, 2021")
      end
    end

    describe "#clean_time " do
      it "can just give us the hours and minutes with a am/pm filter" do
        expect(@party1.clean_time).to eq("06:00PM")
      end
    end
  end
end
