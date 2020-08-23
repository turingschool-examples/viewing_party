class Cast
  attr_reader :members
  def initialize(cast_info)
    @members = cast_info.first(10).inject({}) do |acc, cast_member|
      acc[cast_member[:name]] =  cast_member[:character]
      acc
    end
  end
end
