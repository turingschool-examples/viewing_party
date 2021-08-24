class ApiService
  def get_data(url)
    Faraday.new(url)
  end

  def get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end