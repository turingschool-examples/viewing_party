class StreamingProvider
  attr_reader :streaming_name

  def initialize(attributes)
    @provider_name = attributes[:provider_name]
  end
end