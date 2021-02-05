class Review
  attr_reader :author,
              :content

  def initialize(data)
    # require 'pry'; binding.pry
    @author = data[:author]
    @content = data[:content]
  end
end