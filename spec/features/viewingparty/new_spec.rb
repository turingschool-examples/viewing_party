require "rails_helper"

feature 'As a user' do
given!(:user) {@user = create(:user)}
  describe 'when I visit the new viewing party page' do
    before(:each) do
      @friend_1 = create(:user)
      @friend_2 = create(:user)
      @friend_3 = create(:user)
      @friend_4 = create(:user)
      @user.friends << @friend_1
      @user.friends << @friend_2
      @user.friends << @friend_3
      @user.friends << @friend_4
      page.set_rack_session(user_id: @user.id)
    end

    it 'I should see a form with viewing party details', :vcr do
      visit movie_path(155)
      expect(page).to have_button('Create Viewing Party for Movie')
      click_on 'Create Viewing Party for Movie'
      expect(current_path).to eq(new_viewing_party_path)
      save_and_open_page
      expect(page).to have_content('The Dark Knight')
      expect(page).to have_field('viewing[duration_of_party]')
      expect(page).to have_field('viewing[date(2i)]')
      expect(page).to have_field('viewing[start_time(4i)]')
      @user.friends.each do |friend|
        expect(page).to have_field("viewing[friends[#{friend.id}]]", checked: false)
      end
      expect(page).to have_button('Create Viewing Party')
      click_on 'Create Viewing Party'
      # expect(current_path).to eq(user_dashboard_path(@user.id))
    end

    it 'I can see viewing parties on the user dashboard index', :vcr do
    end
  end
end
