require 'rails_helper'

RSpec.describe UserFriendship, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end
end
