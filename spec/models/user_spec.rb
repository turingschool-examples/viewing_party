require 'rails_helper'

describe User do
  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:email)}
    it {should have_secure_password}
  end
end
