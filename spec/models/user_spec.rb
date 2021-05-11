require 'rails_helper'

describe User do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should uniqueness_of(:email)}
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:password_digest)}
  end
end
