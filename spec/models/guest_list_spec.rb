require 'rails_helper'

RSpec.describe GuestList, type: :model do
  describe "relationships" do
    it { should belong_to :party}
    it { should belong_to(:friend).class_name('User')}
  end
end
