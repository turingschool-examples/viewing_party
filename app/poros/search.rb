class Search
  def first_40_results(data)
    data.flatten.first(40).map do |movie|
      {
        title: movie[:title],
        vote_average: movie[:vote_average]
      }
    end
  end
end
