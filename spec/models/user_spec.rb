require "rails_helper"

RSpec.describe User do
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
        user = create(:mock_user)
        result = "#{user.first_name} #{user.last_name}"
        expect(user.full_name).to eq(result)
      end
    end
  end
end
