require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "validations" do
    it {should validate_presence_of :mdb_id}
    it {should validate_uniqueness_of :mdb_id}

    it {should have_many(:parties)}
    # it {should have_many(:viewers).through(:viewing_parties)}
  end

end
