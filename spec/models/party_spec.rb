require 'rails_helper'

RSpec.describe Party do
  describe 'validations' do
    it {should validate_presence_of :duration}
    it {should validate_presence_of :scheduled_date}
    it {should validate_presence_of :start_time}
    it {should validate_presence_of :movie_id}
    it {should validate_presence_of :movie_title}
  end

  describe "associations" do

    it {should have_many :users}

  end
end
