require 'rails_helper'

describe Party, type: :model do
  describe "relationships" do
    it { should belong_to(:host).class_name('User')}
    it { should have_many :guest_lists }
    it {should have_many(:friends).through(:guest_lists).class_name('User')}


  end
end
