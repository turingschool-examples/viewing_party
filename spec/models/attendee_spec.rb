require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:status) }
  end

  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:party) }
  end
end
