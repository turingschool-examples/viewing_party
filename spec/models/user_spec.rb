require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}

    it {should validate_confirmation_of(:password)}
    it {should validate_presence_of(:password_confirmation)}
  end

  describe "instance methods" do
    before do
      @user = User.create(email: "me@example.com",password: "password123", password_confirmation: "password123")
      @friend = User.create(email: "MyFriend@example.com",password: "password123", password_confirmation: "password123")

      @my_party = Party.create!( # hard coding doesn't matter here because the api is never being accessed.
        movie_id: 606244,
        movie_title: "The greatest movie ever",
        user_id: @user.id,
        scheduled_date: Date.today,
        start_time: Time.now,
        duration: 50
      )

      @my_friends_party = Party.create!( # hard coding doesn't matter here because the api is never being accessed.
        movie_id: 606245,
        movie_title: "The second greatest movie ever",
        user_id: @friend.id,
        scheduled_date: Date.today,
        start_time: Time.now,
        duration: 50
      )

      @party_im_not_invited_to = Party.create( # hard coding doesn't matter here because the api is never being accessed.
        movie_id: 606245,
        movie_title: "The third greatest movie ever",
        user_id: @friend.id,
        scheduled_date: Date.today,
        start_time: Time.now,
        duration: 50
      )
      UserParty.create(party: @my_friends_party, user: @user)
    end

    # it "get_parties" do
    #   expected = {
    #     hosting: [@my_party],
    #     invited: [@my_friends_party]
    #   }
    #   expect(@user.get_parties).to eq(expected)
    # end
  end
end
