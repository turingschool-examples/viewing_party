require 'rails_helper'

RSpec.describe ViewingEvent, type: :model do
  describe 'relationships' do
    it {should have_many(:viewers)}
    it {should have_many(:users).through(:viewers)}
    it {should belong_to(:movie)}
    it {should belong_to(:user)}
  end
end
