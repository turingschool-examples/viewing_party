require 'rails_helper'

RSpec.describe Event do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:attendees) }
    it { should have_many(:users).through(:attendees) }
  end
  describe 'validations' do

  end
end
