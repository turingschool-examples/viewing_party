require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of :username}
    it {should validate_presence_of :email}
  end

  describe "relationships" do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
    it {should have_many :user_view_parties}
    it {should have_many(:view_parties).through(:user_view_parties)}
  end

  describe "class methods" do
    it "creates a new user with #from_omniauth" do
      user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      email = "test@gmail.com"
      test_hash = OmniAuth::AuthHash.new({info: {email: email}})

      expect(User.from_omniauth(test_hash)).to eq(User.last)
    end
  end
  describe "instance methods" do
    it "can rsvp" do
      user = User.create!(username: "Quentin", email: "tarantino@gmail.com")
      party = user.view_parties.create!(date: "2020-08-30", movie_title: "Speed", runtime: "90", time: "19:30")

      expect(party.attending?(user)).to be_falsey
      user.rsvp(party)
      expect(party.attending?(user)).to eq(true)
    end
  end
end
