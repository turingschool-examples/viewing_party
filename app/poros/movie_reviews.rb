class MovieReview

  attr_reader :total_results, :reviews

  def initialize(results)
    @total_results = results[:total_results]
    @reviews = results[:reviews]
  end

  def first_10_cast_members

  end
end
