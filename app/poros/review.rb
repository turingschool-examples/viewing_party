class Review
  attr_reader :author,
              :content

  def initialize(review_details)
    @author = review_details[:author]
    @content = review_details[:content]
  end
end
