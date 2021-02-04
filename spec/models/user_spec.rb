require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
    it { should validate_presence_of :password }
    it { should validate_presence_of :name }

    it {should have_many(:friendships)}
    it {should have_many(:friends).through(:friendships)}
    it {should have_many(:viewers)}
    it {should have_many(:parties).through(:viewers)}
  end
end
