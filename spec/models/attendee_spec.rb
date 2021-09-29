require 'rails_helper'
RSpec.describe Attendee, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:event) }

  end
  before :each do

  end
  describe 'class methods' do
    describe '.' do
    end
  end
  describe 'instance methods' do
    describe '#' do
    end
  end
end
