require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_uniqueness_of :email}
    it {should validate_presence_of :password}
  end

  describe 'relationships' do
    it {should have_many :friendships}
    it {should have_many(:friends).through(:friendships)}
  end

  describe 'methods' do
    before :each do
      @user = User.create!(email: 'tony@stark.com', password: '1234')
      @friend1 = User.create!(email: 'elon@musk.com', password: '1234')
      @friend2 = User.create!(email: 'nikola@tesla.com', password: '1234')
      @friend3 = User.create!(email: 'thomas@edison.com', password: '1234')

      @party2 = Party.create!(title: "Rush Hour", duration: 220, date: '12/20/20', time: '4:00')

      UserParty.create!(party_id: @party2.id, attendee_id: @friend1.id, is_host: true)
      UserParty.create!(party_id: @party2.id, attendee_id: @friend2.id)
      UserParty.create!(party_id: @party2.id, attendee_id: @user.id)
    end

    it 'invited_parties' do
      @user.invited_parties.each do |party|
        expect(party.class).to eq(Party)
      end
    end

    it 'host_parties' do
      @user.host_parties.each do |party|
        expect(party.class).to eq(Party)
      end
    end
  end
end
