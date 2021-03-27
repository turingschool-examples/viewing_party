require 'rails_helper'

describe Party, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should belong_to :movie }
    end
  end
