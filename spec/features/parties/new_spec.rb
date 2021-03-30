require 'rails_helper'

RSpec.describe "As an authenticated user" do
  describe "when I navigate to create a new party from Fight Club" do
    it "has a form to fill out attributes" do
      VCR.use_cassette('viewing_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"
        click_button("Create Viewing Party for Movie")

        expect(page).to have_content("Movie Title: Fight Club")
        expect(page).to have_content("Date and Time of Event:")
        expect(page).to have_content("Duration:")
      end
    end
    it "creates a party object when the form is submitted" do
      VCR.use_cassette('create_new_viewing_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        click_button("Create Viewing Party for Movie")


        fill_in :duration, with: 900
        fill_in :date, with: (DateTime.now + 5)
        click_on "Create Party"

        expect(current_path).to eq(dashboard_path)
        expect(Party.exists?(user_id: user.id, movie_title: "Fight Club")).to eq(true)
      end
    end
    it "creates sends an error message if a date is not filled out" do
      VCR.use_cassette('sad_date_viewing_party_error_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        click_button("Create Viewing Party for Movie")


        fill_in :date, with: ""
        click_on "Create Party"

        expect(page).to have_content("Date and duration must be selected")
      end
    end
    it "creates sends an error message if a date is not filled out" do
      VCR.use_cassette('sad_duration_viewing_party_error_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        click_button("Create Viewing Party for Movie")


        fill_in :duration, with: ""
        click_on "Create Party"

        expect(page).to have_content("Date and duration must be selected")
      end
    end

    it 'Has checkboxs to invite each new friend to a viewing party' do
      VCR.use_cassette('invite_friends_to_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        user2 = user.friends.create(email: "a@a.com", password: "test")
        user3 = user.friends.create(email: "b@b.com", password: "test")
        user4 = user.friends.create(email: "c@c.com", password: "test")

        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'
        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        # expect(current_path).to eq(movie_path())
        click_button("Create Viewing Party for Movie")
        expect(current_path).to eq(new_party_path)

        within("#friend-check-#{user2.id}") do
          page.check('friends', allow_label_click: true)
        end
        within("#friend-check-#{user3.id}") do
          page.check('friends', allow_label_click: true)
        end

        within("#friend-check-#{user4.id}") do
          page.check('friends', allow_label_click: true)
        end
      end
    end

    it 'can fill out a form and check the boxes next to each friends to add to a new viewing party' do
      VCR.use_cassette('invite_friends_to_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        user2 = user.friends.create(email: "a@a.com", password: "test")
        user3 = user.friends.create(email: "b@b.com", password: "test")
        user4 = user.friends.create(email: "c@c.com", password: "test")

        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'

        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        # expect(current_path).to eq(movie_path())
        click_button("Create Viewing Party for Movie")
        expect(current_path).to eq(new_party_path)

        expect(page).to have_field(:date)
        expect(page).to have_field(:duration)

        fill_in 'date', with: (DateTime.now + 5)
        fill_in 'duration', with: 140

        within("#friend-check-#{user2.id}") do
          page.check('friends', allow_label_click: true)
        end
        within("#friend-check-#{user3.id}") do
          page.check('friends', allow_label_click: true)
        end

        within("#friend-check-#{user4.id}") do
          page.check('friends', allow_label_click: true)
        end

        click_button 'Create Party'

        expect(current_path).to eq(dashboard_path)
        expect(page).to have_content("140 minutes")
        # expect(page).to have_content("Hosting: #{user.email}")

        within("#friends-#{user.id}") do
          expect(page).to have_content(user2.email)
          expect(page).to have_content(user3.email)
          expect(page).to have_content(user4.email)
        end
      end
    end

    it "can create a party without friends" do
      VCR.use_cassette('invite_friends_to_party_path') do
        user = User.create(email: "joeb@email.com", password: "test")
        user2 = user.friends.create(email: "a@a.com", password: "test")
        user3 = user.friends.create(email: "b@b.com", password: "test")
        user4 = user.friends.create(email: "c@c.com", password: "test")
        # require "pry"; binding.pry

        visit root_path
        click_link "Login"
        fill_in :email, with: user.email.upcase
        fill_in :password, with: user.password
        click_button 'Login'

        within(".topnav") do
          click_link "Discover Movies"
        end

        fill_in :movie_query, with: "Fight Club"
        click_on("Find Movies")
        click_link "Fight Club"

        # expect(current_path).to eq(movie_path())
        click_button("Create Viewing Party for Movie")
        expect(current_path).to eq(new_party_path)

        expect(page).to have_field(:date)
        expect(page).to have_field(:duration)

        fill_in 'date', with:(DateTime.now + 5)
        fill_in 'duration', with: 140

        # within("#friends_#{user2.id}") do
          # page.check('friends[]', allow_label_click: true)

          # check 'friends'
        # end
        find(:css, "#friends_#{user2.id}").set(true)
        # save_and_open_page

        # within("#friends_#{user3.id}") do
        #   page.check('friends[]', allow_label_click: true)
        # end
        find(:css, "#friends_#{user3.id}").set(true)

        # within("#friends_#{user4.id}") do
        #   page.check('friends[]', allow_label_click: true)
        # end
        find(:css, "#friends_#{user4.id}").set(true)

        click_button 'Create Party'
        expect(current_path).to eq(dashboard_path)

        expect(page).to have_content("140 minutes")
        # expect(page).to have_content("Hosting: #{user.email}")

        within("#invited-viewing-parties") do
          expect(page).to_not have_content(user2.email)
          expect(page).to_not have_content(user3.email)
          expect(page).to_not have_content(user4.email)
        end
      end
    end
  end
end
