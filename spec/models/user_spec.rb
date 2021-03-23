require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:followed_users) }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many(:following_users) }
    it { should have_many(:followers).through(:following_users) }
  end

  describe 'validations' do
    it {validate_presence_of :full_name}
    it {validate_presence_of :email}
    it {validate_uniqueness_of :email}
    it {validate_presence_of :password}
    it {validate_confirmation_of :password}
  end
end
