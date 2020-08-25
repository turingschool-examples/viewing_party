require 'rails_helper'

RSpec.describe ViewingParties do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :duration }
    it { should validate_presence_of :poster }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
  end
  describe 'relationships' do
    it { should belong_to :user}
  end
end
