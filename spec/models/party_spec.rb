require 'rails_helper'

RSpec.describe Party, type: :model do
  describe 'relationships' do
    it { should belong_to(:movie) }
    it { should belong_to(:host) }
    it { should have_many(:invitees) }
    it { should have_many(:users).through(:invitees) }
  end
end
