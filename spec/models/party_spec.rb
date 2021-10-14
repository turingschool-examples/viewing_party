require "rails_helper"

RSpec.describe Party do
  describe "validations" do
    it { should validate_presence_of(:movie_title) }
    it { should validate_presence_of(:duration) }
    it { should validate_presence_of(:time) }
    it { should validate_presence_of(:date) }
  end

  describe 'relationships' do
    it { should have_many(:attendees).dependent(:destroy) }
    it { should have_many(:users).through(:attendees) }
  end
end
