class MovieFacade
  attr_reader :service
  
  def initialize
    @service = MovieService.new
  end
  
end