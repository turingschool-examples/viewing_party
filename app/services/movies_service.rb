class MoviesService 

  def top40
    get_json
  end 

  private

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("") do |faraday|
      faraday.params[key] = 
    end 
  end
end 