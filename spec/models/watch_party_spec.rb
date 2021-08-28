require 'rails_helper'

RSpec.describe WatchParty, type: :model do
  describe 'relationships' do
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:movie) }
  end

  before :each do

  end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end
