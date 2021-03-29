class Cast
  attr_reader :members

  def initialize(cast)
    @members = format(cast)
  end

  def format(cast)
    formatted_cast = []
    cast.each do |member|
      member_hash = {name: member[:name], character: member[:character]}
      formatted_cast << member_hash
    end
    formatted_cast
  end

end