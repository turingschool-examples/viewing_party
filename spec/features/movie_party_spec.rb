
require 'rails_helper'

RSpec.describe 'Movies Page' do
  let(:user) { create(:user) }

  describe 'page has desired info' do
    it '' do
      # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      # VCR.use_cassette 'imdb_top' do
      #
      #   visit '/dashboard'
      #
      #   expect(page).to have_button(value='Discover Top 40 Movies')
      #
      #   click_on 'Discover Top 40 Movies'
      #
      #   expect(page).to have_current_path("/discover", ignore_query: true)
      #   expect(page).to have_button('Find Top Rated Movies')
      #   expect(page).to have_content('Luca')
      end


    it 'displays movie title' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit "/movie_party/new?title=Spider-Man:%20Homecoming"

      expect(page).to have_content('Spider-Man: Homecoming')
    end

    describe 'there is a form to fill out data' do
      it 'form has movie runtime field' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming"

        expect(page).to have_content('Runtime')
        expect(page).to have_field('runtime')
      end
      it 'sellect date field' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming"

        expect(page).to have_content("date")
        expect(page).to have_field("date")
      end
      it 'start time field ' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        visit "/movie_party/new?title=Spider-Man:%20Homecoming"

        expect(page).to have_content("time")
        expect(page).to have_field("time")
    end


      describe 'checkboxes for firends' do
        it 'if you have friends' do
        end
        it 'if  you have no friends' do
        end
      end
    end
  end

  describe 'subbmitng the form ' do
    describe 'happy path' do
      it 'creates a new entry in the data base' do
      end

      it 'creates attendees based on the firends you invite' do
      end

      it 'takes you to the dash board when done' do

      end
    end

    describe 'sad path' do
      it 'requires a run time' do
      end
      it 'requires runtime be greater than movie runtime' do
      end
      it ' requires you enter in a data' do
      end
      it 'requires a start time' do
      end
    end

  end


end
