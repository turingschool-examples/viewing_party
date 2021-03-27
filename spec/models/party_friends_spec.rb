require 'rails_helper'

describe PartyFriend, type: :model do
  describe "relationships" do
    it { should belong_to :party }
    it { should belong_to :friendship }
  end
end
