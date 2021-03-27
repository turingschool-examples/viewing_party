require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it { has_many :parties }

    end
  end
