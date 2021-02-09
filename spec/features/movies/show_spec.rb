require 'rails_helper'

describe 'movie show page', :vcr do
  before :each do
    @user = User.create(email: "ely@me.com", password: "password")
    allow_any_instance_of(Current).to receive(:user).and_return(@user)

    visit movie_path(330457)
  end

  it 'shows the title' do
    expect(page).to have_content('Frozen ii')
  end

  it 'shows the vote average' do
    expect(page).to have_content('7.3')
  end

  it 'shows the runtime in hours and minutes' do
    expect(page).to have_content('1:44')
  end

  it 'shows the associated genres' do
    expect(page).to have_content('Music')
    expect(page).to have_content('Fantasy')
    expect(page).to have_content('Comedy')
    expect(page).to have_content('Adventure')
    expect(page).to have_content('Animation')
    expect(page).to have_content('Family')
  end

  it 'shows the summary description' do
    expect(page).to have_content('Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.')
  end

  it 'lists the first 10 cast members' do
    expect(page).to have_content('Kristen Bell')
    expect(page).to have_content('Idina Menzel')
    expect(page).to have_content('Josh Gad')
    expect(page).to have_content('Jonathan Groff')
    expect(page).to have_content('Sterling K. Brown')
    expect(page).to have_content('Evan Rachel Wood')
    expect(page).to have_content('Alfred Molina')
    expect(page).to have_content('Martha Plimpton')
    expect(page).to have_content('Jason Ritter')
    expect(page).to have_content('Rachel Matthews')
  end

  it 'shows a count of all the reviews' do
    expect(page).to have_content('Movie Review Total: 7')
  end

  it 'shows each review author and information' do
    expect(page).to have_content('deRedtube')
    expect(page).to have_content('Olaf provides ample humor')
    expect(page).to have_content('SWITCH.')
    expect(page).to have_content("I wouldn’t go so far as to call it a disappointment")
    expect(page).to have_content('msbreviews')
    expect(page).to have_content('I didn’t watch a single trailer')
    expect(page).to have_content('JPV852')
    expect(page).to have_content('Better than the first film which I found lackluster in almost every area outside the animation')
    expect(page).to have_content('tylero')
    expect(page).to have_content('Exactly what one can expect from a Disney princess movie.')
    expect(page).to have_content('r96sk')
    expect(page).to have_content('Entertaining, once more. No complaints from me.')
    expect(page).to have_content('Louisa Moore - Screen Zealots')
    expect(page).to have_content("Making a quality sequel can be tough, and even moreso when it’s a follow-up to a beloved modern classic.")
  end

  it 'has a button to create a viewing party' do
    expect(page).to have_button('Create Movie Party')
  end
end
