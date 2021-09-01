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

      date_1 = '2021-08-24'
      time_1 = '10:00 PM'
      date_2 = '2021-08-25'
      time_2 = '11:00 PM'

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit new_party_path(movie_id: 121)

      within('#form') do
        expect(page).to have_content("Create The Lord of the Rings: The Two Towers Viewing Party!")
        expect(find_field('duration').value).to eq("#{179}")
        expect(page).to have_content(user_4.email)
        expect(page).to_not have_content(user_5.email)

        fill_in 'date', with: date_1
        fill_in 'time', with: time_1
        find(:css, "#friend_ids_[value=#{user_2.id}]").set(true)
        find(:css, "#friend_ids_[value=#{user_3.id}]").set(true)
        click_button 'Create Party'
      end

      expect(current_path).to eq(dashboard_index_path)

      user_1 = User.find(user_1.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit new_party_path(movie_id: 122)

      within('#form') do
        expect(page).to have_content("Create The Lord of the Rings: The Return of the King Viewing Party!")
        expect(find_field('duration').value).to eq("#{201}")
        expect(page).to have_content(user_2.email)
        expect(page).to_not have_content(user_5.email)

        fill_in 'date', with: date_2
        fill_in 'time', with: time_2
        find(:css, "#friend_ids_[value=#{user_3.id}]").set(true)
        find(:css, "#friend_ids_[value=#{user_4.id}]").set(true)
        click_button 'Create Party'
      end

      expect(current_path).to eq(dashboard_index_path)

      within('#my_parties') do
        user_1.parties.each_with_index do |party, index|
          within("##{party.id}") do
            expect(page).to have_content("Party #{index + 1}")
            expect(page).to have_content(party.movie)
            expect(page).to have_content(party.date.strftime('%B %d, %Y'))
            expect(page).to have_content(party.time.in_time_zone('Mountain Time (US & Canada)').strftime('%l:%M %P'))
            expect(page).to have_content('Hosting')
          end
        end
      end
    end
  end
end
