class ViewParty
  attr_reader :movie_title, :date, :runtime
  def initialize(info)
    @movie_title = info[:title]
    @date = info[:date]
    @runtime = info[:runtime]
  end
end 