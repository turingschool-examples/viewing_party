require 'rails_helper'

describe "Welcome Page:" do
  it 'it has a welcome message and description' do
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Description")
  end

  it 'it has a link to register a new user' do
    visit '/'

    expect(page).to have_link("New to Viewing Party? Register Here.")
  end

  it 'A user can log in' do
    user = User.create!(
      username: "JonathonDoe",
      email: "jonathon@doe.com",
      password: "1234"
    )
    visit '/'

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Login')

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Login'
    expect(current_path).to eq('/user/dashboard')
    expect(page).to have_content("Welcome #{user.username}!")
    expect(page).to have_content("You have successfully logged in!")
    save_and_open_page

  end

  it 'will not let me login with bad credentials' do
    user = User.create!(
      username: "JonathonDoe",
      email: "jonathon@doe.com",
      password: "1234"
    )
    visit '/'

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Login')

    fill_in :email, with: user.email
    fill_in :password, with: '4321'
    click_on 'Login'

    expect(page).to have_content('Your e-mail or password was incorrect!')
  end
end
