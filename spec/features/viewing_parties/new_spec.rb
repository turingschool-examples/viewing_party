require 'rails_helper'

RSpec.describe 'New viewing party' do
  describe 'As a Visitor' do
    before :each do
      @user = User.create!(name: 'Phil', email: 'a@a.com', password: 'a', password_confirmation: 'a')
      @user1 = User.create!(name: 'Jade', email: 'b@a.com', password: 'a', password_confirmation: 'a')
      @user2 = User.create!(name: 'Robert', email: 'c@a.com', password: 'a', password_confirmation: 'a')
      @user3 = User.create!(name: 'Luke', email: 'd@a.com', password: 'a', password_confirmation: 'a')

      Friendship.create!(user_id: @user.id, friend_id: @user1.id)
      Friendship.create!(user_id: @user.id, friend_id: @user2.id)
      Friendship.create!(user_id: @user.id, friend_id: @user3.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    describe "When I visit a new viewing party page for" do
      it "I see a form with an un-editable field containing a movie title" do

        visit "/new_party/#{@user.id}/princess_mononoke"
        expect(page).to have_xpath("//input[@value='Princess Mononoke']")
      end
    end
  end
end
