require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
#    it { should have_many :parties }
    it { should have_many(:parties).dependent(:destroy) }
  end
end
