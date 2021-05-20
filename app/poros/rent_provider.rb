class RentProvider
  attr_reader :provider_name

  def initialize(attributes)
    @provider_name = attributes[:provider_name]
  end
end
