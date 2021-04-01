require 'ostruct'

class MovieSearchService < ApiMovieService
  def self.top_movies(limit)
    results = []
    number_pages = (limit / 20) + 1
    number_pages.times do |n|
      movie_data = get_data(url_storage(num: n)[:movie_top])
      movie_data[:results].each do |movie_info|
        results << create_movie_openstruct(movie_info)
      end
    end
    results.first(limit)
  end

  def self.movie_search(search, limit)
    search_results = []
    unless results_page_count((url_storage(num: 0, query: search)[:movie_search])).nil?
      results_page_count((url_storage(num: 0, query: search)[:movie_search])).times do |n|
        search_data = get_data((url_storage(num: n, query: search)[:movie_search]))
        search_data[:results].each do |movie_info|
          search_results << create_movie_openstruct(movie_info)
        end
      end
    end
    search_results.first(limit)
  end

  def self.movie_information(api_movie_id)
    info = get_data((url_storage(movie_id: api_movie_id)[:movie_info]))
    if !info[:id].nil?
      create_movie_details_openstruct(info)
    else
      []
    end
  end

  def self.trending_movies(limit)
    results = []
    until results.length >= limit
      trending_movies_data = get_data(url_storage[:trending_movies])
      trending_movies_data[:results].each do |movie_info|
        results << create_movie_openstruct(movie_info)
      end
    end
    results.first(limit)
  end

  def self.create_movie_openstruct(movie_info)
    OpenStruct.new({  api_id: movie_info[:id],
                      title: movie_info[:title],
                      vote_average: movie_info[:vote_average] })
  end

  def self.create_movie_details_openstruct(movie_info)
    OpenStruct.new({ api_id: movie_info[:id],
                     title: movie_info[:title],
                     vote_average: movie_info[:vote_average],
                     runtime: movie_info[:runtime],
                     genres: movie_info_genres(movie_info[:genres]),
                     summary: movie_info[:overview],
                     cast: movie_info_cast(movie_info[:id]),
                     reviews: movie_info_reviews(movie_info[:id]),
                     poster_path: movie_info[:poster_path] })
  end
end
