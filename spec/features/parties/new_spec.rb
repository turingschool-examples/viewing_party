require 'rails_helper'

RSpec.describe 'new viewing party', type: :feature do
  describe 'page' do
    before :each do
      @user = create :user
      @friend1 = create :user
      @friend2 = create :user
      @friend3 = create :user
      @user.add_friend(@friend1)
      @user.add_friend(@friend2)
      @user.add_friend(@friend3)
      visit '/'
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'has default movie data and friends to check' do
      VCR.use_cassette('viewing_party_new') do
        #Party can be created
        @movie = MovieFacade.movie_details(5)

        visit '/movies/5'

        click_on 'Create Viewing Party!'
        expect(current_path).to eq('/parties/new')

        expect(page).to have_content(@movie.title)

        expect(page).to have_content("Please check which friends you'd like to invite")
        expect(page).to have_content(@friend1.email)
        expect(page).to have_content(@friend2.email)
        expect(page).to have_content(@friend3.email)

        find('#party_datetime_of_party').fill_in with: DateTime.current

        within ("#party_invited_ids_#{@friend1.id}") do
          check
        end

        within ("#party_invited_ids_#{@friend2.id}") do
          check
        end

        click_on 'Create Viewing Party'

        expect(current_path).to eq('/dashboard')
        # User sees their hosted parties
        expect(page).to have_content("Your Parties")
        expect(page).to have_content(@movie.title)
        expect(Party.all.size).to eq(1)

        expect(page).to have_content(@friend1.email)
        expect(page).to have_content("Undecided")
        expect(page).to have_content(@friend2.email)
        expect(page).to have_content("Undecided")

        # User sees their invited to parties
        visit '/'
        fill_in 'Email', with: @friend1.email
        fill_in 'Password', with: @friend1.password
        click_on 'Log in'

        expect(page).to have_content("Your Party Invites")

        expect(page).to have_content(@movie.title)
        expect(page).to have_content(Party.first.datetime_of_party)
        expect(page).to have_content("Undecided")

        expect(page).to have_button("I'm in!")
        expect(page).to have_button("Hard Pass")

        click_button 'Hard Pass'

        expect(current_path).to eq('/dashboard')

        expect(page).to have_content("Your Status: Hard Pass")
        expect(page).to have_button("I'm in!")
        expect(page).to_not have_button('Hard Pass')

        click_button "I'm in!"

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Your Status: I'm in!")

        expect(page).to_not have_button("I'm in!")
        expect(page).to have_button('Hard Pass')

        #User sees guest statuses
        visit '/'
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_on 'Log in'

        expect(page).to have_content('Undecided')
        expect(page).to have_content("I'm in!")
      end
    end
    it 'cannot be created without filling all fields' do
      VCR.use_cassette('viewing_party_new') do
        #Party can be created
        @movie = MovieFacade.movie_details(5)

        visit '/movies/5'

        click_on 'Create Viewing Party!'
        expect(current_path).to eq('/parties/new')

        expect(page).to have_content(@movie.title)

        expect(page).to have_content("Please check which friends you'd like to invite")
        expect(page).to have_content(@friend1.email)
        expect(page).to have_content(@friend2.email)
        expect(page).to have_content(@friend3.email)

        within ("#party_invited_ids_#{@friend1.id}") do
          check
        end

        within ("#party_invited_ids_#{@friend2.id}") do
          check
        end

        click_on 'Create Viewing Party'
        expect(page).to have_content("Datetime of party can't be blank")

        expect(current_path).to eq('/parties/new')
      end
    end
  end
end
