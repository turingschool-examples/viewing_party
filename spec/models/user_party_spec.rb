require 'rails_helper'

RSpec.describe UserParty do
  describe 'validations' do
    it { should validate_presence_of :party_id }
    it { should validate_presence_of :user_id }
  end
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :party }
  end
end
