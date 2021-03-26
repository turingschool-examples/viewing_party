require 'rails_helper'

RSpec.describe MovieObject, type: :model do
  before :each do
    @movie ||= MovieService.movie_object(100)
  end

  describe 'attributes' do
    it 'attributes' do
      description = "A card shark and his unwillingly-enlisted friends need to make a lot of cash quick after losing a sketchy poker match. To do this they decide to pull a heist on a small-time gang who happen to be operating out of the flat next door."

      expect(@movie.description).to eq(description)
      expect(@movie.id).to eq(100)
      expect(@movie.title).to eq("Lock, Stock and Two Smoking Barrels")
      expect(@movie.vote_count).to eq(4700)
      expect(@movie.vote_average).to eq(8.2)
    end
  end

  describe 'instance methods' do
    it '#runtime' do
      expect(@movie.runtime).to eq('1:45')
    end

    it '#first_10_cast_members' do
      cast = [
              {:actor=>"Jason Flemyng", :character=>"Tom"},
              {:actor=>"Dexter Fletcher", :character=>"Soap"},
              {:actor=>"Nick Moran", :character=>"Eddie"},
              {:actor=>"Jason Statham", :character=>"Bacon"},
              {:actor=>"Vinnie Jones", :character=>"Big Chris"},
              {:actor=>"Sting", :character=>"JD"},
              {:actor=>"Steven Mackintosh", :character=>"Winston"},
              {:actor=>"Nicholas Rowe", :character=>"J"},
              {:actor=>"Lenny McLean", :character=>"Barry the Baptist"},
              {:actor=>"P.H. Moriarty", :character=>"'Hatchet' Harry Lonsdale"}
            ]

      expect(@movie.first_10_cast_members).to eq(cast)
    end

    it '#genres' do
      genres = ["Comedy", "Crime"]

      expect(@movie.genres).to eq(genres)
    end

    it '#review_authors' do
      reviews = [
                  {:content=>"I just plain love this movie!", :name=>"BradFlix"},
                  {:content=> "Far from being a good movie, with tons of flaws but already pointing to the pattern of the whole Ritchie's filmography.", :name=>"Andres Gomez"},
                  {:content=> "Genuinely one of my favorite movies of all time. Watched again recently and realised how well written, brilliantly shot, beautifully cast and cleverly produced this movie actually is!", :name=>"David Perkins"}
                ]

      expect(@movie.review_authors).to eq(reviews)
    end

    it '#cast_member_helper' do
      cast = [
                {:actor=>"Jason Flemyng", :character=>"Tom"},
                {:actor=>"Dexter Fletcher", :character=>"Soap"},
                {:actor=>"Nick Moran", :character=>"Eddie"},
                {:actor=>"Jason Statham", :character=>"Bacon"},
                {:actor=>"Vinnie Jones", :character=>"Big Chris"},
                {:actor=>"Sting", :character=>"JD"},
                {:actor=>"Steven Mackintosh", :character=>"Winston"},
                {:actor=>"Nicholas Rowe", :character=>"J"},
                {:actor=>"Lenny McLean", :character=>"Barry the Baptist"},
                {:actor=>"P.H. Moriarty", :character=>"'Hatchet' Harry Lonsdale"},
                {:actor=>"Frank Harper", :character=>"Dog"},
                {:actor=>"Huggy Leaver", :character=>"Paul"},
                {:actor=>"Stephen Marcus", :character=>"Nick the Greek"},
                {:actor=>"Peter McNicholl", :character=>"Little Chris"},
                {:actor=>"Nick Marcq", :character=>"Charles"},
                {:actor=>"Tony McMahon", :character=>"John"},
                {:actor=>"Steve Sweeney", :character=>"Plank"},
                {:actor=>"Charles Forbes", :character=>"Willie"},
                {:actor=>"Vas Blackwood", :character=>"Rory Breaker"},
                {:actor=>"Jake Abraham", :character=>"Dean"},
                {:actor=>"Victor McGuire", :character=>"Gary"},
                {:actor=>"Danny John-Jules", :character=>"Barfly Jack"},
                {:actor=>"Elwin 'Chopper' David", :character=>"Nathan"},
                {:actor=>"Vera Day", :character=>"Tanya"},
                {:actor=>"Rob Brydon", :character=>"Traffic Warden"},
                {:actor=>"Alan Ford", :character=>"Alan / Narrator"},
                {:actor=>"Andrew Tiernan", :character=>"Man in Pub"},
                {:actor=>"Matthew Vaughn", :character=>"Yuppy In Car"},
                {:actor=>"Richard Vanstone", :character=>"Frazer"},
                {:actor=>"Jimmy Flint", :character=>"Don"}
              ]

      expect(@movie.cast_member_helper).to eq(cast)
    end

    it '#time_conversion' do
      expect(@movie.time_conversion(90)).to eq('1:30')
      expect(@movie.time_conversion(125)).to eq('2:05')
    end
  end
end
