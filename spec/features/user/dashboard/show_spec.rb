require 'rails_helper'

feature 'As a user' do
  given!(:user) {@user = create(:user)}
  describe 'when i visit my dashboard, I will see' do
    before(:each) do
      @viewing1 = create(:viewing)
      @viewing1.guests.create!(user_id: @user.id, hosting: true)
      @viewing2 = create(:viewing)
      @viewing2.guests.create!(user_id: @user.id, hosting: true)
      @viewing3 = create(:viewing)
      @viewing3.guests.create!(user_id: @user.id, hosting: false)
      @viewing4 = create(:viewing)
      @friend_1 = create(:user)
      @friend_2 = create(:user)
      @friend_3 = create(:user)
      @friend_4 = create(:user)
      page.set_rack_session(user_id: @user.id)
      visit user_dashboard_path
    end

    it 'I should see a section with all of my friends' do
      expect(page).to have_css('.friends')
      within('.friends') do
        expect(page).to have_button('Add Friend')
        expect(page).to have_field(:friends_email)
        fill_in :friends_email, with: @friend_1.email
        click_button 'Add Friend'
      end

      expect(current_path).to eq(user_dashboard_path)

      within('.friends') do
        expect(page).to have_content(@friend_1.username)
        fill_in :friends_email, with: @friend_2.email
        click_button 'Add Friend'
      end

      within('.friends') do
        expect(page).to have_content(@friend_2.username)
        fill_in :friends_email, with: @friend_3.email
        click_button 'Add Friend'
      end

      expect(page).to have_content(@friend_3.username)
      expect(page).to_not have_content(@friend_4.username)

      within('.friends') do
        fill_in :friends_email, with: 'cool_email@bro.gov'
        click_button 'Add Friend'
      end

      expect(page).to have_content('Sorry, I cannot find your friend.')
    end

    it 'If I have no friends, I see a message' do
      expect(page).to have_content('You currently have no friends. 🥺')
    end

    it 'If I try to add the same friend multiple times I get an error' do
      within('.friends') do
        fill_in :friends_email, with: @friend_1.email
        click_button 'Add Friend'
      end

      within('.friends') do
        fill_in :friends_email, with: @friend_1.email
        click_button 'Add Friend'
      end

      expect(page).to have_content('You have already added that friend.')
      expect(page).to_not have_content(@friend_1.username, count: 2)
    end

    it 'I should see a section with all my viewings' do
      expect(page).to have_css('.viewing-parties')
      within('.viewing-parties') do
        expect(page).to have_content(@viewing1.movie.title)
        expect(page).to have_content(@viewing1.date)
        expect(page).to have_content(@viewing1.start_time)
        expect(page).to have_content('Host')

        expect(page).to have_content(@viewing2.movie.title)
        expect(page).to have_content(@viewing2.date)
        expect(page).to have_content(@viewing2.start_time)
        expect(page).to have_content('Host')

        expect(page).to have_content(@viewing3.movie.title)
        expect(page).to have_content(@viewing3.date)
        expect(page).to have_content(@viewing3.start_time)
        expect(page).to have_content('Guest')

        expect(page).to_not have_content(@viewing4.movie.title)
      end
    end

    it 'I see a link to discover movies' do
      expect(page).to have_button('Discover Movies')
      click_button('Discover Movies')
      expect(current_path).to eq(discover_index_path)
    end
  end
end
