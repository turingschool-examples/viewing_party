require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should have_many(:attendees)}
    it {should have_many(:users).through(:attendees)}
  end

  describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:time)}
    it {should validate_presence_of(:movie)}
    it {should validate_presence_of(:duration)}
    it {should validate_numericality_of(:duration)}
  end

  describe 'class methods' do
  end

  describe 'instance methods' do
  end
end
