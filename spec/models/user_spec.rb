require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :user_name }
    it { should validate_uniqueness_of :user_name }
    it { should validate_presence_of :password_digest }
    it { should validate_confirmation_of :password }
  end
  describe 'relationships' do
    it { should have_many :user_parties }
    it { should have_many(:parties).through(:user_parties) }
    it { should have_many :followed_users }
    it { should have_many(:followees).through(:followed_users) }
    it { should have_many :following_users }
    it { should have_many(:followers).through(:following_users) }
  end
end
