require 'rails_helper'

RSpec.describe "Local movie" do
  before do
    @data = {:adult=>false,
      :backdrop_path=>"/srYya1ZlI97Au4jUYAktDe3avyA.jpg",
      :genre_ids=>[14, 28, 12],
      :id=>464052,
      :original_language=>"en",
      :original_title=>"Wonder Woman 1984",
      :overview=>
       "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s and finds a formidable foe by the name of the Cheetah.",
      :popularity=>3454.018,
      :poster_path=>"/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg",
      :release_date=>"2020-12-16",
      :title=>"Wonder Woman 1984",
      :video=>false,
      :vote_average=>7,
      :vote_count=>3400
    }

    @movie = LocalMovie.new(@data)
  end

  it "creates a local movie poros object" do
    expect(@movie).to be_a(LocalMovie)
    expect(@movie).to have_attributes(:id => @data[:id], :title => @data[:title], :vote_average => @data[:vote_average])
  end
  
end