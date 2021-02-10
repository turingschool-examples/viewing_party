require 'rails_helper'

RSpec.describe User do
  describe 'relationships', type: :model do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:inverse_friends) }
    it { should have_many(:inverse_friends).through(:inverse_friendships) }
    it { should have_many(:parties) }
    it { should have_many(:party_guests) }
  end

  describe 'validations' do
    it { should validate_presence_of :email }
    it { should validate_presence_of :password }
  end

  describe 'instance methods' do
    it 'saves email as lower case' do
      email1 = 'ROB@ME.COM'
      @user = User.create(email: email1, password: '123abc')

      expect(@user.email).to eq('rob@me.com')
    end
  end
end
