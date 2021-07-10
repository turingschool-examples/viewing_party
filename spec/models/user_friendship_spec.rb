require 'rails_helper'

RSpec.describe UserFriendship do
  describe 'realtionships' do
    it {should belong_to(:user)}
    it {should belong_to(:friend)}
  end
end
