class Film
	attr_reader :title,
	            :vote_average,
	            :runtime,
	            :popularity,
	            :genres,
	            :overview,

		def initialize(data)
			@title        = data[:title].capitalize
			@vote_average = data[:vote_average]
			@runtime      = data[:runtime]
			@popularity   = data[:popularity]
			@genres       = data[:genres]
			@overview     = data[:overview]
			@cast         = cast
			@reviews      = reviews
		end

end
