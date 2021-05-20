class ComingSoon
  attr_reader :release_date, :image, :title

  def initialize(data)
    @release_date = data[:release_date]
    @title = data[:title]
  end
end
