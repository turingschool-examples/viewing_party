class MovieReview
  attr_reader :author,
              :rating

  def initialize(attributes)
    @author = attributes[:author]
    @rating = attributes[:author_details][:rating]
  end
end