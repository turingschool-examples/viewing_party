require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "relationships" do
    it { should belong_to :user }
    it { should have_many :guest_lists}
  end
end