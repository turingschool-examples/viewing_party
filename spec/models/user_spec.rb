require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_many(:attendees).through(:events) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
  end
  describe 'validations' do

  end
end
