require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}

    it {should validate_confirmation_of(:password)}
    it {should validate_presence_of(:password_confirmation)}
  end

  it "find_accepted_friends" do
    jamie = User.create!(email: "jamie@email.org", password: "dsaffsdsa", password_confirmation: "dsaffsdsa")

    user2 = User.create!(email: "kelsey@email.org", password: "dsaffsdsa", password_confirmation: "dsaffsdsa")
    user3 = User.create(email: "bobby@email.org", password: "axcver", password_confirmation: "axcver")
    user4 = User.create(email: "jane@email.org", password: "dsarertgfffsdsa", password_confirmation: "dsarertgfffsdsa")
    user5 = User.create(email: "elisa@email.org", password: "eutkjgkx", password_confirmation: "eutkjgkx")
    user6 = User.create(email: "allie@email.org", password: "eutkjgasdvkx", password_confirmation: "eutkjgasdvkx")
    user7 = User.create(email: "jason@email.org", password: "eutkjgasdweewvkx", password_confirmation: "eutkjgasdweewvkx")
    user8 = User.create(email: "emily@email.org", password: "eutkjgazcvsdvkx", password_confirmation: "eutkjgazcvsdvkx")

    Friend.create!(sender_id: jamie.id, receiver_id: user8.id, request_status: 0)
    Friend.create(sender_id: jamie.id, receiver_id: user2.id, request_status: 0)
    Friend.create(sender_id: user3.id, receiver_id: jamie.id, request_status: 2)
    Friend.create(sender_id: user6.id, receiver_id: jamie.id, request_status: 0)
    Friend.create(sender_id: user7.id, receiver_id: jamie.id, request_status: 1)
    # Friend.create(sender_id: user7.id, receiver_id: jamie.id, request_status: 1)
    
    expected_results = [user8, user2, user6]
    results = jamie.find_accepted_friends

    expect(results).to match_array(expected_results)
  end
end
