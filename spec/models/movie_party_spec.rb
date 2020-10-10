require 'rails_helper'

describe MovieParty, type: :model do
  describe 'validations' do
    it {should validate_presence_of :movie_title}
    it {should validate_presence_of :duration}
    it {should validate_presence_of :date}
    it {should validate_presence_of :start_time}
  end

  describe 'relationships' do
    #host
    it {should belong_to :user}
    #joins table
    it {should have_many :party_users}
    #attendees
    it {should have_many(:users).through(:party_users)}
  end
end
