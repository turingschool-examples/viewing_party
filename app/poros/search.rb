class Search
  attr_reader :title, :vote_avg, :search_id

  def initialize(attributes)
    @title = attributes[:original_title]
    @vote_avg = attributes[:vote_average]
    @search_id = attributes[:id]
  end
end
