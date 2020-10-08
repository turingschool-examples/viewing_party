require 'rails_helper'

RSpec.describe "User Dashboard: Friends" do
  before :each do
    @user = User.create!(email: 'tony@stark.com', password: '1234')
    @friend_1 = User.create!(email: 'friend1@user.com', password: '1234')
    @friend_2 = User.create!(email: 'friend2@user.com', password: '1234')
    @friend_3 = User.create!(email: 'friend3@user.com', password: '1234')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit user_dashboard_path(@user.id)
  end

  it "List of friends sad path" do
    within('.friends') do
      expect(page).to have_content('You have no friends')
      expect(page).to have_field(:email)
      expect(page).to have_button('Add Friend')
    end
  end

  it "User can add friends" do
    within('.friends') do
      expect(page).to have_content('You have no friends')
      fill_in :email, with: @friend_1.email
      click_button 'Add Friend'
      expect(page).to have_content(@friend_1.email)
      expect(page).to_not have_content('You have no friends')
    end
    expect(current_path).to eq(user_dashboard_path(@user.id))
  end

  it "User can add friends sad path" do
    within('.friends') do
      expect(page).to have_content('You have no friends')
      fill_in :email, with: 'random_email@user.com'
      click_button 'Add Friend'
      expect(page).to have_content('You have no friends')
    end
    expect(page).to have_content("I'm sorry. You're friend cannot be found.")
    expect(current_path).to eq(user_dashboard_path(@user.id))
  end
end
