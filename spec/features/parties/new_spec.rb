require 'rails_helper'

RSpec.describe "new movie party", :vcr do
  describe 'form' do
    it 'displays form to create movie party when filled out' do
      user_1 = create(:user)
      user_2 = create(:user)
      user_3 = create(:user)
      user_4 = create(:user)
      user_5 = create(:user)

      user_1.followed << user_2
      user_1.followed << user_3
      user_1.followed << user_4

      date = '08/24/2021'
      time = '07:00 PM'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit new_party_path(movie_id: 121)

      within('#form') do
        expect(page).to have_content("Create The Lord of the Rings: The Two Towers Viewing Party!")
        expect(find_field('duration').value).to eq("#{179}")
        expect(page).to have_content(user_4.email)
        expect(page).to_not have_content(user_5.email)

        fill_in 'date', with: date
        fill_in 'time', with: time
        find(:css, "#friend_ids_[value=#{user_2.id}]").set(true)
        find(:css, "#friend_ids_[value=#{user_3.id}]").set(true)
        click_button 'Create Party'
      end

      expect(current_path).to eq(dashboard_index_path)

      within('#my_parties') do
        expect(page).to have_content('Lord of the Rings')
        expect(page).to have_content('August 24, 2021')
        expect(page).to have_content('7:00 pm')
        expect(page).to have_content('Hosting')
      end
    end
  end
end
