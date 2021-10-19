require "rails_helper"

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:mock_user)
    @friend = create(:mock_user)
    @not_friend = create(:mock_user)
    @user.friends << @friend
  end
  describe "validations" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'relationships' do
    it { should have_many(:attendees).dependent(:destroy) }
    it { should have_many(:parties).through(:attendees) }
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
  end

  describe 'instance methods' do
    describe '#full_name' do
      it 'returns user full name' do
        result = "#{@user.first_name} #{@user.last_name}"
        expect(@user.full_name).to eq(result)
      end
    end

    describe '#has_friend' do
      it 'returns true if user is already friend' do
        expect(@user.current_friend(@friend)).to eq(true)
      end
      it 'returns false if use is not already friend' do
        expect(@user.current_friend(@not_friend)).to eq(false)
      end
    end
  end
end
