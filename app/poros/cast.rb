class Cast
  attr_reader :members

  def initialize(cast_info)
    @members = cast_members(cast_info)
  end

  def cast_members(cast_info)
    cast_info.first(10).each_with_object({}) do |member, obj|
      obj[member[:name]] = member[:character]
    end
  end
end
