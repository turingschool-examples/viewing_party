require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    # it { should have_many :friends }
    # it { should have_many :parties }
    # it { should have_many :guests }
    it { should have_many(:friends).dependent(:destroy) }
    it { should have_many(:parties).dependent(:destroy) }
    it { should have_many(:guests).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:password_digest) }
  end
end
