
require 'rails_helper'

RSpec.describe 'Movies Page' do
  let(:user) { create(:user) }

  describe 'page has desired info' do
    it 'displays movie title' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

      expect(page).to have_content('Spider-Man: Homecoming')
    end

    describe 'there is a form to fill out data' do
      it 'form has movie runtime field' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

        expect(page).to have_content('Duration')
        expect(page).to have_field('duration')
      end
      it 'sellect date field' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

        expect(page).to have_content("date")
        expect(page).to have_field("date")
      end
      it 'start time field ' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

        expect(page).to have_content("time")
        expect(page).to have_field("time")
    end


      describe 'checkboxes for firends' do
        it 'if you have friends' do

          friend_1 = User.create(email: 'friend@budies.com', password: 'tester')
          friend_2 = User.create(email: 'best_friend@budies.com', password: 'tester')
          friend_3 = User.create(email: 'anoying_aquaintence@budies.com', password: 'tester')
          friend_4 = User.create(email: 'frennemy@budies.com', password: 'tester')
          friend_5 = User.create(email: 'stranger@budies.com', password: 'tester')


          friendA1 = Friend.new(friender: user, friendee: friend_1)
          friendA2 = Friend.new(friender: user, friendee: friend_2)
          friendA4 = Friend.new(friender: user, friendee: friend_4)
          friendB0 = Friend.new(friender: friend_3, friendee: user)
          friendS3 = Friend.new(friender: friend_5, friendee: friend_3)
          friendS4 = Friend.new(friender: friend_5, friendee: friend_4)
          friend20 = Friend.new(friender: friend_2, friendee: user)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

          # expect(page).to have_field('friends', type: 'checkbox')
          expect(page).to have_content(friendA1.friendee.email)
          expect(page).to have_content(friendA2.friendee.email)
          expect(page).to have_content(friendA4.friendee.email)
          expect(page).to have_no_content(friendB0.friendee.email)
          expect(page).to have_no_content(friendS3.friendee.email)
          expect(page).to have_no_content(friendS4.friendee.email)
          expect(page).to have_no_content(friend20.friendee.email)

        end

        it 'if  you have no friends' do
          friend_3 = User.create(email: 'anoying_aquaintence@budies.com', password: 'tester')
          friend_4 = User.create(email: 'frennemy@budies.com', password: 'tester')
          friend_5 = User.create(email: 'stranger@budies.com', password: 'tester')


          friendB0 = Friend.new(friender: friend_3, friendee: user)
          friendS3 = Friend.new(friender: friend_5, friendee: friend_3)
          friendS4 = Friend.new(friender: friend_5, friendee: friend_4)

          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=2"

          # expect(page).to have_field('friends', type: 'checkbox')
          expect(page).to have_no_content(friendB0.friendee)
          expect(page).to have_no_content(friendS3.friendee)
          expect(page).to have_no_content(friendS4.friendee)
        end
      end
    end
  end

  describe 'subbmitng the form ' do
    describe 'happy path' do
      it 'creates a new entry in the data base' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=20"

        no_party = MovieParty.find_by(runtime: 10)
        expect(no_party).to eq(nil)

        fill_in :duration, with: 10
        fill_in :date, with:'2-2-2022'
        fill_in :time, with: '08:00 AM'

        click_on "Save"

        new_party = MovieParty.find_by(runtime: 10)

        expect(new_party).to_not eq(nil)
      end

      it 'creates attendees based on the firends you invite' do



      end

      it 'takes you to the dash board when done' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=20"

        fill_in :duration, with: 10
        fill_in :date, with:'2-2-2022'
        fill_in :time, with: '08:00 AM'

        click_on "Save"

        expect(current_path).to eq("/dashboard")
      end
    end

    describe 'sad path' do
      it 'requires a run time' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming&runtime=130"

        fill_in :duration, with: "2"
        fill_in :date, with:'2-2-2022'
        fill_in :time, with: ''

        click_on "Save"

        # expect(current_path).to eq("/movie_party/new?title=Spider-Man:%20Homecoming&runtime=130")

 # binding.pry
        # message = page.find("#party_form").native.attribute("validationMessage")
        # expect(message).to eq "Please fill out this field."
        # expect(current_path).to eq(edit_link_path(user.links.first))

      end
      it 'requires runtime be greater than movie runtime' do



      end
      it ' requires you enter in a date' do
      end
      it 'requires a start time' do
      end
    end

  end


end
