require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
    it { should have_many(:party_guests) }
  end
end
