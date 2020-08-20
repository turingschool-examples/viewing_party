class SessionsController < ApplicationController

  def create
    code = params[:code]
    client_id = ENV["GOOGLE_CLIENT_ID"]
    client_secret = ENV["GOOGLE_CLIENT_SECRET"]

    conn = Faraday.new(url: 'https://google.com', headers: {'Accept': 'application/json'})

    response = conn.post('/login/oauth/access_token') do |req|
      req.params['code'] = code
      req.params['client_id'] = client_id
    end

    binding.pry

    data = JSON.parse(response.body, symbolize_names: true)
    access_token = data[:access_token]

  end
end
