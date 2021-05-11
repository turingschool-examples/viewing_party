require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it { should have_many :parties }
    it { should have_many(:users).through(:parties) }

  end
end
