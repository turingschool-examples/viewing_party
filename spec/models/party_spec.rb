require 'rails_helper'

describe Party, type: :model do
  describe "relationships" do
    it { should belong_to :movie }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
    it { should validate_presence_of :duration }
  end
end
