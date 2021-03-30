class MovieService

 def self.top_rated(limit)
   @results = []
   page_num = 1
   until @results.count >= limit
     info = self.make_api_call("movie/top_rated?language=en-US&page=#{page_num}")
     return info if info[:error]
     @results += info[:results]
     page_num += 1
   end
   self.create_objects(@results, limit)
 end

 def self.search(keywords, limit)
   keywords = keywords.gsub(/ /, '%20')
   @results = []
   page_num = 1
   until @results.count >= limit
     info = self.make_api_call("search/movie?language=en-US&query=#{keywords}&page=#{page_num}&include_adult=false")
     return info if info[:error]
     return self.create_objects(@results, limit) if info[:results].count.zero?
     @results += info[:results]
     page_num += 1
   end
   self.create_objects(@results, limit)
 end

 private

 def self.create_objects(info, limit)
   info.map do |movie|
     OpenStruct.new({id: movie[:id], title: movie[:title], vote_average: movie[:vote_average], poster_path: movie[:poster_path]})
   end.first(limit)
 end

 def self.make_api_call(url)
   response = self.connection.get(url)
   if response.status == 200
     data = response.body
     JSON.parse(data, symbolize_names: true)
   else
     response = Hash.new([])
     response[:error] = true
     response
   end
 end

 def self.connection
   Faraday.new(url: 'https://api.themoviedb.org/3/', params: { api_key: ENV['movie_api_key'] })
 end
end
