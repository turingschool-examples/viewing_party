require 'rails_helper'

describe Viewing, type: :model do
  describe "validations" do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:start_time)}
    it {should validate_numericality_of(:duration_of_party).is_greater_than(0) }
  end

  describe 'relationships' do
    it {should belong_to(:movie)}
    it {should have_many(:guests)}
    it {should have_many(:users).through(:guests)}
  end

  describe 'instance methods' do
    it '#user_hosting?' do
      user1 = create(:user)
      user2 = create(:user)
      viewing1 = create(:viewing)
      viewing1.guests.create!(user_id: user1.id, hosting: true)
      viewing1.guests.create!(user_id: user2.id, hosting: false)

      expect(viewing1.user_hosting?(user1.id)).to be true
      expect(viewing1.user_hosting?(user2.id)).to be false
    end
  end
end
