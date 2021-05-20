class Similar
  attr_reader :title, :id
  def initialize(data)
    @title = data[:title]
    @id = data[:id]
  end
end
