class Similar
  attr_reader :title, :release_date, :search_id

  def initialize(attributes)
    @title = attributes[:original_title]
    @release_date = attributes[:release_date]
    @search_id = attributes[:id]
  end
end
