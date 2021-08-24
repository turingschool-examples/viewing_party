require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { should have_many(:events) }
    it { should have_many(:attendees).through(:events) }
  end
  describe 'validations' do

  end
end
