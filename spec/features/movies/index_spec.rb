require 'rails_helper'

RSpec.describe "Movies index page" do 
  before(:each)do
    @user = User.create(email: 'test123@xyz.com', password: 'viewparty')
    visit welcome_path
    fill_in :email, with: "test123@xyz.com"
    fill_in :password, with: "viewparty"
    click_button "Sign In"
    visit movies_path
  end
  
  it 'should list the top 40 results from my search' do
    # response_body = File.read('spec/fixtures/top_rated.json')
    save_and_open_page
    # stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated").
    #     to_return(status: 200, body: response_body, headers: {})

    expect(page).to have_content("Dilwale Dulhania Le Jayenge")
    expect(page).to have_content("City of God")
    expect(current_path).to eq(movies_path)
  end

  it 'should list movies from search results by title and vote average' 

  it "should have a Find Top Rate Movies button and form" 
end