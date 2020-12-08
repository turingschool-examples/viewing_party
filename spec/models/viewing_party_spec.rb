require 'rails_helper'

describe ViewingParty, type: :model do

  describe 'relations' do
    it { should belong_to :user }
    it { should have_many :guests }
    it { should have_many(:users).through(:guests) }
  end
end
