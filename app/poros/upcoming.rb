class Upcoming
  attr_reader :title, :release_date

  def initialize(attributes)
    @title = attributes[:title]
    @release_date = attributes[:release_date]
  end
end
