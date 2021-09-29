require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:events) }
    it { should have_many(:followed_users) }
    it { should have_many(:following_users) }
    it { should have_many(:attendees).through(:events) }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many(:followers).through(:following_users) }
  end
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
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
