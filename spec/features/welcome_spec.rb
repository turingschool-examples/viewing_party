require 'rails_helper'

describe "Welcome Page:" do
  it 'it has a welcome message and description' do
    description = 'Invite all your friends and setup a viewing party to watch some exciting movies! Remember, if you are watching a movie alone, Samara will find you and get you.'
    visit '/'

    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content(description)
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

  it 'will let me logout when i click the logout link when I am logged in' do
    user = User.create!(
      username: "JonathonDoe",
      email: "jonathon@doe.com",
      password: "1234"
    )
    visit '/'
    expect(page).to_not have_link('Logout')

    fill_in :email, with: user.email
    fill_in :password, with: user.password
    click_on 'Login'

    expect(page).to have_link('Logout')
    click_link 'Logout'
    expect(current_path).to eq(root_path)
    expect(page).to_not have_link('Logout')
  end
end
