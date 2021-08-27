require 'rails_helper'

RSpec.describe Friend do
  describe 'relationships' do
    it {should belong_to(:follower)}
    it {should belong_to(:followed)}
  end

  describe 'class methods' do

  end
  describe 'instance methods' do

  end
end