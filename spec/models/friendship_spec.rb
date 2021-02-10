require 'rails_helper'

RSpec.describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
  
  describe 'validates uniqueness of friend' do
    user = User.create(email: '123@example.com', password: "test")
    friend = user.friends.create(email: '1234@example.com', password: "test_1")
    it { should validate_uniqueness_of(:friend) }
  end
end
