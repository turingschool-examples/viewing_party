require 'rails_helper'

RSpec.describe 'movie show page' do
  let(:user) { create(:user) }
  describe 'visit a movie show page' do
    it 'displays movie details' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      VCR.use_cassette 'imdb_top_new' do

        visit '/discover'

      end
      VCR.use_cassette 'black_widow_calls' do
        click_on 'Black Widow'

        expect(page).to have_current_path('/movies/details', ignore_query: true)
        expect(page).to have_content('Black Widow')
        expect(page).to have_content('Average Score: 8.2')
        expect(page).to have_content('Runtime: 134')
        expect(page).to have_content('Number of Votes: 2219')
        expect(page).to have_content('Action')
        expect(page).to have_content('Summary: Natasha Romanoff, also known as Black Widow')
        expect(page).to have_content('Scarlett Johansson')
        expect(page).to have_content('garethmb')
        expect(page).to have_content('After a delay lasting 19 months; the Marvel Cinematic Universe (MCU)')
      end
    end
    describe 'reaching new movie party page' do
      it 'passes title and runtime to the movie party' do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
        VCR.use_cassette 'imdb_top_new' do

          visit '/discover'

        end
        VCR.use_cassette 'black_widow_calls' do
          click_on 'Black Widow'

          click_on 'Create Movie Party'

          expect(page).to have_current_path('/movie_party/new')
        end
      end
    end
  end
end