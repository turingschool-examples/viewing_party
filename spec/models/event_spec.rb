require 'rails_helper'

RSpec.describe Event do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:day) }
    it { should validate_presence_of(:start_time) }
    it { should validate_numericality_of(:duration) }

  end
end
