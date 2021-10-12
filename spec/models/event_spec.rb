require 'rails_helper'
RSpec.describe Event , type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:runtime) }
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
