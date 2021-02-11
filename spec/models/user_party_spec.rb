require "rails_helper"

describe UserParty, type: :model do
  describe "associations" do 
    it {should belong_to :user}
    it {should belong_to :party}
  end
end
