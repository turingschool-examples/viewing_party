require 'rails_helper'

RSpec.describe ViewingParty do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :runtime }
    it { should validate_presence_of :poster }
    it { should validate_presence_of :date }
  end
  describe 'relationships' do
    it { should belong_to :user}
  end
end
