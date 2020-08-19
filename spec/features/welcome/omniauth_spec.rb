require 'rails_helper'

RSpec.describe 'As any user' do
  before(:each) do
    OmniAuth.config.mock_auth[:google] = nil
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google]
  end

  describe 'When I visit the landing page' do
    it "can login with Google" do
      OmniAuth.config.add_mock(:google, {:uid => '123456789'})
    end
  end
end
