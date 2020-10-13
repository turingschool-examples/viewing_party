require 'rails_helper'

describe Party, type: :model do
  describe "validations" do
  end
  describe "relationships" do
    it {should belong_to :user}
    it {should have_many :guests}
  end
end
