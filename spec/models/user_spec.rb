require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :access_token }
    it { should validate_presence_of :uid }
    it { should validate_uniqueness_of :uid }
  end

  describe 'relationships' do

  end
end
