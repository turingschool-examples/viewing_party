class PartyFacade
  def self.movie_information(api_movie_id)
    MovieService.movie_information(api_movie_id)
  end
end
