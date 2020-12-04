require 'rails_helper'

describe Guest, type: :model do
  describe "validations" do
    it {should validate_presence_of(:viewing_id)}
    it {should validate_presence_of(:user_id)}
  end

  describe 'relationships' do
    it {should belong_to(:viewing)}
    it {should belong_to(:user)}
  end
end
