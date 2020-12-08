class Actor
  attr_reader :name,
              :character

  def initialize(actor_details)
    @name = actor_details[:name]
    @character = actor_details[:character]
  end
end
