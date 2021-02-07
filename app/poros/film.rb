class Film
	attr_reader :title,
	            :id,
	            :vote_average,
	            :runtime,
	            :popularity,
	            :genres,
	            :overview,
	            :cast,
							:poster,
	            :reviews

	def initialize(data, cast = nil, reviews = nil)
		@id           = data[:id]
		@title        = data[:title].capitalize
		@vote_average = data[:vote_average]
		@runtime      = data[:runtime]
		@popularity   = data[:popularity]
		@genres       = data[:genres]
		@overview     = data[:overview]
		@poster       = data[:poster_path]
		@cast         = cast[:cast]
		@reviews      = reviews[:results]
	end

	def render_image
		unless @poster.nil?
			"https://image.tmdb.org/t/p/w500" + @poster
		end
	end

end
