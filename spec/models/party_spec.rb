require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:party_host)}
    it { should have_many(:attendees)}
  end
end
