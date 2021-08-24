require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    # it { should belong_to(:) }
    it { should have_many(:friendships) }
    it { should have_many(:attendees) }
    it { should have_many(:watch_parties).through(:attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest)}
  end

  before :each do
    
  end

  describe 'class methods' do
   describe '.' do
    end
  end

  describe 'instance methods' do
    describe '#' do
    end
  end
end