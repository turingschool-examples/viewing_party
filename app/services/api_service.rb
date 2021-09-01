class ApiService
  # def get_data(endpoint)
  #   response = Faraday.get(endpoint)
  #   data = response.body
  #   JSON.parse(data, symbolize_names: true)
  # end

  def get_data(endpoint)
    Faraday.new(endpoint)
  end

  def get_json(data)
    JSON.parse(data.body, symbolize_names: true)
  end
end
