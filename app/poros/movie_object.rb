class MovieObject
  attr_reader :description,
              :id,
              :title,
              :vote_count,
              :vote_average

  def initialize(results)
    @description = results[:overview]
    @id = results[:id]
    @title = results[:title]
    @vote_count = results[:vote_count]
    @vote_average = results[:vote_average]
  end

  def runtime
    time_conversion(MovieService.movie_details_get(self.id)[:runtime])
  end

  def first_10_cast_members
    if MovieService.movie_cast_get(self.id)[:cast].size < 10
      cast_member_helper
    else
      cast_member_helper.first(10)
    end
  end

  def genres
    if !MovieService.movie_details_get(self.id)[:genres].nil?
      MovieService.movie_details_get(self.id)[:genres].map do |genre|
        genre[:name]
      end
    else
      ["N/A"]
    end
  end

  def review_authors
    reviews_array = []
    MovieService.reviews_get(self.id)[:results].map do |review|
      review_hash = Hash.new
      review_hash[:name] = review[:author]
      review_hash[:content] = review[:content]
      reviews_array << review_hash
    end
    reviews_array
  end

  def cast_member_helper
    credits_array = []
    MovieService.movie_cast_get(self.id)[:cast].map do |actor|
      credits_hash = Hash.new
      credits_hash[:actor] = actor[:name]
      credits_hash[:character] = actor[:character]
      credits_array << credits_hash
    end
    credits_array
  end

  def time_conversion(minutes)
    hours = minutes / 60
    rest = minutes % 60
    "#{hours}:#{sprintf '%02d', rest}"
  end
end
