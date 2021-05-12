require 'rails_helper'

RSpec.describe Party do
  describe 'relationships' do
    it { should have_many(:party_viewers) }
    it { should belong_to(:host).class_name('User') }
    it { should belong_to(:movie) }
  end
end
