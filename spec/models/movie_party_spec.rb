require 'rails_helper'

RSpec.describe MovieParty, type: :model do

  describe 'relationships' do
    it { should have_many(:attendees) }
    it { should have_many(:users) }
  end

end
