require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'relationships' do
    it { should have_many(:frienders), through: :friendees }
    it { should have_many(:frienders).class_name('Friend') }
    it { should have_many(:friendees).class_name('Friend') }
    it { should have_many(:attendees) }
    it { should have_many(:viewing_parties), through: :attendees}
    it { should have_many(:viewing_parties)}
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
  end

end
