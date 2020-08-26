require 'rails_helper'

RSpec.describe PartyGuest do
  describe 'relationships' do
    it { should belong_to :view_party}
    it { should belong_to :user}
  end
end
