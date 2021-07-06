require 'rails_helper'

descripe Friendship do
  describe 'relationships' do
    it {should belong_to(:user)}
    it {should belong_to(:friend)}
  end
end
