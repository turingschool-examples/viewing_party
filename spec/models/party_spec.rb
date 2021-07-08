require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "validations" do
    [:movie_id, :title, :duration, :date, :start_time].each do |attribute|
      it {should validate_presence_of attribute}
    end
  end

  describe "relationships" do
    it {should have_many :invitations}
    it {should have_many(:users).through(:invitations)}
  end
end
