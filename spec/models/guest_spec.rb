require 'rails_helper'

describe Guest, type: :model do
  describe "validations" do
    xit {should validate_presence_of(:party)}
    xit {should validate_presence_of(:user)}
  end
  describe "relationships" do
    it {should belong_to :user}
    it {should belong_to :party}
  end
end
