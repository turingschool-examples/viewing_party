require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:parties) }
  end

  describe 'validations' do
    it 'saves email as lower case' do
      email1 = 'ROB@ME.COM'
      @user = User.create(email: email1, password: '123abc')

      expect(@user.email).to eq('rob@me.com')
    end
  end
end
