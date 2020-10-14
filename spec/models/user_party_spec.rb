require 'rails_helper'

RSpec.describe UserParty do
  describe 'relationships' do
    it { should belong_to :party }
    it { should belong_to :attendee }
  end
end
