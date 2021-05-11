require 'rails_helper'

RSpec.describe Movie do
  describe 'validations' do
    it { should validate_presence_of :title}
    it { should validate_presence_of :api_id}
  end

  describe 'relationships' do
    it { should have_many(:parties) }
    it { should have_many(:party_viewers).through(:parties) }
  end
end
