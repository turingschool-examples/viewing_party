class ImdbService

  def self.top_movies(movie_numbers = 40)
    results_array = []
    page_number = 1
    until results_array.length >= movie_numbers
      response = top_movies_page(page_number)
      results = response[:results]
      results.each do |movie|
        results_array << movie
      end
      page_number +=1
    end
    results_array.first(movie_numbers)
  end

  def self.top_movies_page(page)
    response = con.get("/3/discover/movie?sort_by=popularity.desc&page=#{page}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  # def self.top_movies_search(search = nil)
  #   search_terms = search.gsub(' ', '+')
  #   results_array = []
  #   index = 1
  #   until results_array.length >= 2
  #     results_array.push(con.get("/3/search/movie?query=#{search_terms}&page=#{index}").body)
  #     index += 1
  #   end
  #   results_array.flatten.map do |page_results|
  #     JSON.parse(page_results, symbolize_names: true)[:results]
  #   end.flatten
  # end

  def self.top_movies_search(search = nil, movie_numbers = 40)
    search_terms = search.gsub(' ', '+')
    results_array = []
    page_number = 1
    until results_array.length >= movie_numbers
      response = top_movies_search_page(search_terms, page_number)
      results = response[:results]
      if results == []
        return []
      end
      results.each do |movie|
        results_array << movie
      end
      page_number +=1
    end
    results_array.first(movie_numbers)
  end

  def self.top_movies_search_page(search, page)
    response = con.get("/3/search/movie?query=#{search}&page=#{page}")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_data(movie_id)
    response = con.get "/3/movie/#{movie_id}"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.movie_cast(movie_id)
    response = con.get "/3/movie/#{movie_id}/credits"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  def self.movie_reviews(movie_id)
    response = con.get "/3/movie/#{movie_id}/reviews"
    body = response.body
    JSON.parse(body, symbolize_names: true)
  end

  private

  def self.con
    Faraday.new(url: 'https://api.themoviedb.org') do |faraday|
      faraday.params[:api_key] = ENV['IMDB_KEY']
    end
  end
end
