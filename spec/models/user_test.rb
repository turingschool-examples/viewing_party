require 'rails_helper'

class UserTest < ActiveSupport::TestCase
  assert_instance_of :name, :email, :token, :refresh_token

end
