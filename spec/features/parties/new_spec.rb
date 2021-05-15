require 'rails_helper'

describe 'New Viewing Party Page' do
  before :each do
    @user = User.create(user_name: 'joeyh@test.com', password: 'doyouwanttohearasong')
    # create two more users
    # User adds one of the other two 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit new_party_path()
  end
  it "for an authenticated user, it should display the name of the movie title \
      rendered above a form with fields for: Duration of Party with a default \
      value of movie runtime in minutes, When: field to select date, Start\ 
      Time: field to select time, Checkboxes next to each friend (if user has \
      friends), Button to create a party" do 

    expect(page).to have_content('Create a New Viewing Party for Mortal Kombat')
    expect(page).to have_content('Duration of Party:')
    expect(page).to have_content('110') # default value - Mortal Kombat runtime in minutes
    expect(page).to have_content('When:')
    expect(page).to have_content('Start Time:')
    expect(page).to have_button('Create Party')
  end

  it 'HAPPY PATH - User should be able to fill in a form and create a new party' do
    fill_in 'Duration of Party', with: 130
    fill_in 'When', with:                     # Look up how to test date field
    fill_in 'Start Time', with:               # Look up field to select a time
    # Look up checkboxes

    click_button 'Create Party'

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Mortal Kombat Party on June 17, 2021')
  end

  it 'HAPPY PATH - When logged in, party should be seen by any friends that were invited' do
    fill_in 'Duration of Party', with: 130
    fill_in 'When', with:                     # Look up how to test date field
    fill_in 'Start Time', with:               # Look up field to select a time
    # Look up checkboxes

    click_button 'Create Party'

    # Log out user
    # Log in an invited friend 
    # expect(page).to have_content('Mortal Kombat Party on June 17, 2021')

    # Log out user 
    # Log in non-friend user 
    # expect(page).to_not have_content('Mortal Kombat Party on June 17, 2021')
  end

  it 'SAD PATH - displays a message to the user if the new discount was not saved' do
    fill_in 'Duration of Party', with: 130
    fill_in 'When', with:                     # Look up how to test date field
    fill_in 'Start Time', with:               # Look up field to select a time
    # Look up checkboxes

    click_button 'Create Party'

    expect(current_path).to eq(new_party_path)
    expect(page).to have_content('Mortal Kombat')
    expect(page).to have_content('Duration of Party')
    
    expect(page).to have_content('Party was not saved. Try again.')
  end
end
