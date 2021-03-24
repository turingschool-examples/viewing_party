require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:followed_users) }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many(:following_users) }
    it { should have_many(:followers).through(:following_users) }
  end

  describe 'validations' do
    it {validate_presence_of :full_name}
    it {validate_presence_of :email}
    it {validate_uniqueness_of :email}
    it {validate_presence_of :password}
    it {validate_confirmation_of :password}
  end

  describe 'instance methods' do
    before :each do
      @movie = create(:movie)
      @host = create(:user, password: 'password')
      @friend_1 = create(:user, password: 'password2')
      @friend_2 = create(:user, password: 'password3')
      @friend_3 = create(:user, password: 'password3')
      @party = create(:party, user_id: @host.id, movie_id: @movie.id)
      create(:invitee, party_id: @party.id, user_id: @friend_1.id)
      create(:invitee, party_id: @party.id, user_id: @friend_2.id)
    end

    it "parties i'm invited to" do
      expect(@friend_1.parties_im_invited_to).to eq([@party])
      expect(@friend_2.parties_im_invited_to).to eq([@party])
      expect(@host.parties_im_invited_to).to eq([])
    end
  end
end
