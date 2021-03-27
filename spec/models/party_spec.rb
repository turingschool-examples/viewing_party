require 'rails_helper'

describe Party, type: :model do
  describe "relationships" do
    it { belongs_to :movie }

    end
  end
