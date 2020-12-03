require 'rails_helper'

feature 'As a user' do
  given!(:user) {@user = create(:user)}
  describe 'when i visit my dashboard, I will see' do
    before(:each) do
      @viewing1 = create(:viewing)
      @viewing2 = create(:viewing)
      @viewing3 = create(:viewing)
      @viewing4 = create(:viewing)
      @user.viewings << [@viewing1, @viewing2, @viewing3]
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

    it 'I should see a section with all my viewings' do
      
    end

    it 'I see a link to discover movies' do

    end
  end
end
