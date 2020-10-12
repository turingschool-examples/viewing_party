class Actor
  attr_reader :id,
              :name,
              :character
  def initialize(actor_data)
    @id = actor_data[:id]
    @name = actor_data[:name]
    @character = actor_data[:character]
  end
end
