require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :friends }
    it { should have_many :parties }
    it { should have_many :guests }
  end
end