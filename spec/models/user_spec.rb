require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should have_secure_password}
  end

  describe 'relationships' do
    it {should have_many(:friendships)}
    it {should have_many(:friends).through(:friendship)}
    it {should belong_to(:user).through(:friendship)}
  end
end
