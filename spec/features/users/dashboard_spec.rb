require 'rails_helper'
RSpec.describe 'dashboard page' do
  before :each do
    @user_1 = User.create(email: 'blahblah@test.com', password: 'password1')
    @user_2 = User.create(email: 'erin@test.com', password: 'password2')
    @user_3 = User.create(email: 'jacq@test.com', password: 'password3')
  end

#   As an authenticated user,
# I see a section for friends,
# In this section, there should be a text field to enter a friend's email and a button to "Add Friend"
#
# Scenarios:
#
# If I have not added any friends there should be a message. "You currently have no friends".
#
# If I have added friends, I should see a list of all my friends.
#
# Details: Users should be able to add a friend by their email address, as long as, the friend is a user of our application and exists in our database.
  it 'has a section for friends' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_1.email
    fill_in 'password', with: @user_1.password

    click_on 'Submit'

    expect(page).to have_content("My Friends:")
  end

  it 'has message for no friends' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_1.email
    fill_in 'password', with: @user_1.password

    click_on 'Submit'

    expect(page).to have_content("You currently have no friends.")
  end

  it 'can search for another user by email address' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: @user_3.email

    expect(page).to have_button("Add Friend")
  end

  it 'returns a flash message if the user tries to add itself' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: @user_2.email

    click_on 'Add Friend'

    expect(page).to have_content("You cannot follow yourself!")
  end

  it 'returns a flash message if the user tries to add a friend they already have' do
    @user_4 = User.create(email: 'blank@test.com', password: 'password4')
    @user_2.followers << @user_4

    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: @user_4.email

    click_on 'Add Friend'

    expect(page).to have_content("You already follow #{@user_4.email}!")
  end

  it 'returns a successful flash message when the user adds a friend' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: @user_3.email

    click_on 'Add Friend'

    expect(page).to have_content("You are now following #{@user_3.email}!")
  end

  it 'returns a flash message if the user searched does not exist in the database' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: 'blah@test.com'

    click_on 'Add Friend'

    expect(page).to have_content("User not found. Please try your search again.")
  end

  it 'shows all added friends when there are friends' do
    visit "/"
    click_on "Log In"

    fill_in 'email', with: @user_2.email
    fill_in 'password', with: @user_2.password

    click_on 'Submit'

    fill_in 'user_search', with: @user_3.email

    click_on 'Add Friend'

    fill_in 'user_search', with: @user_1.email

    click_on 'Add Friend'

    expect(page).to have_content("#{@user_3.email}")

    expect(page).to have_content("#{@user_1.email}")

    expect(page).to have_no_content("You currently have no friends.")
  end
end
