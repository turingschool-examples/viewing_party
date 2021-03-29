class Review 
  attr_reader :length,
              :review_data

  def initialize(data)
    @length = data.length
    @review_data = format(data)
  end

  def format(review)
    formatted_data = []
    review.each do |review|
      review_hash = {author: review[:author], content: review[:content]}
      formatted_data << review_hash
    end
    formatted_data
  end

end