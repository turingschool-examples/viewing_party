require 'rails_helper'

describe Party, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :user }
  end
end
