require 'rails_helper'

RSpec.describe 'you visit your dashboard ' do
  before :each do
    visit dashboards_path
  end

  context 'movies section ' do
    it 'there is a button to search movies', :vcr do

      expect(page).to have_button('Discover Movies')

      click_on 'Discover Movies'

      expect(current_path).to eq(discover_path)

    end
  end

  context 'you see firnds section ' do

    context 'you have friends' do
      before :each do
        @user_1 = User.create(email: '123@numb.edu', password: '123', name: "number")
        @user_2 = User.create(email: 'abc@letter.edu', password: '123', name: "letter")
        @user_3 = User.create(email: 'stuff@biz.com', password: '123', name: "proffesional")

        @friend_1a = @user.friendships.create(friend: @user_1)
        @friend_1b = @user.friendships.create(friend: @user_2)
        visit dashboards_path
      end

      it 'you can see your friends list' do

        expect(page).to have_content(@user_1.name)
        expect(page).to have_content(@user_2.name)
        expect(page).to have_no_content(@user_3.name)
      end

      it 'you cannot add a friend you already have' do

        fill_in 'friend', with: '123@numb.edu'
        click_on 'Add Friend'

        expect(page).to have_content("This user does not exist, or you are already their friend")
      end

      it 'you can add a friend', :logged_out do

        visit register_path
        fill_in "user[email]", with: "555@dooffus.edu"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        fill_in "user[name]", with: "The Doof"
        click_on("Register")

        visit dashboards_path

        expect(page).to have_button('Add Friend')
        expect(page).to have_no_content(@user_3.name)

        fill_in 'friend', with: @user_3.email
        click_on 'Add Friend'

        expect(current_path).to eq(dashboards_path)
        expect(page).to have_content(@user_3.name)
      end
    end

    context 'you may or may not have friends yet' do
      it 'has no friends in it', :logged_out do
        visit register_path
        fill_in "user[email]", with: "555@dooffus.edu"
        fill_in "user[password]", with: "password"
        fill_in "user[password_confirmation]", with: "password"
        fill_in "user[name]", with: "The Doof"
        click_on("Register")

        visit dashboards_path
        expect(page).to have_content("You currently have no friends.")
      end

      context 'you want to add a friend' do
        it 'you cannot add a friend who is not in the data base' do
          fill_in 'friend', with: "asldfkjalsdfk"
          click_on 'Add Friend'

          expect(page).to have_content('This user does not exist, or you are already their friend')
        end

        it 'you cannot add yourself as a friend you sad looser' do
          fill_in 'friend', with: @user.email
          click_on 'Add Friend'

          expect(page).to have_content('You cant be friends with yourself!')
        end
      end
    end
  end
end
