require 'rails_helper'

RSpec.describe "user logs in", type: :feature do
  scenario "using google oauth2" do
    def stub_omniauth
      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
        provider: "google",
        uid: "12345678910",
        info: {
          email: "test@gmail.com",
          first_name: "Phillip",
          last_name: "Strom"
        },
        credentials: {
          token: "abcdefg12345",
          refresh_token: "12345abcdefg",
          expires_at: DateTime.now,
        }
      })
    end
    stub_omniauth
    visit "/"
    expect(page).to have_content("Log In with Google")
    click_on "Log In with Google"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome Phillip Strom to the Viewing Party!")
    expect(page).to have_link("Discover Movies!")
  end
  scenario "using bad credentials" do
    def stub_omniauth
      # first, set OmniAuth to run in test mode
      OmniAuth.config.test_mode = true
      # then, provide a set of fake oauth data that
      # omniauth will use when a user tries to authenticate:
      OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({})
    end
    stub_omniauth
    visit "/"
    expect(page).to have_content("Log In with Google")
    click_on "Log In with Google"
    expect(current_path).to eq("/")
    expect(page).to have_content("Credentials don't work")
  end
end
