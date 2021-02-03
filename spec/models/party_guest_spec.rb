require 'rails_helper'

RSpec.describe PartyGuest do
  describe 'relationships' do
    it { should belong_to(:party) }
    it { should belong_to(:friendship) }
  end
end
