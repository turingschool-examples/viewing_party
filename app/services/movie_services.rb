class MovieService < ApiService
  def name
    endpoint = ''
    get_data(endpoint)
  end
end
