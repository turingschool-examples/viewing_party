require 'rails_helper'

RSpec.describe Attendee, type: :model do
  describe 'relationships' do
    it { should belong_to(:watch_party) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should define_enum_for(:status).with([:hosting, :invited]) }
  end

  # before :each do
    
  # end

  # describe 'class methods' do
  #  describe '.' do
  #   end
  # end

  # describe 'instance methods' do
  #   describe '#' do
  #   end
  # end
end