module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    JSON.parse(response.body)
  end

  # Get a valid JWT based on existing user
  def login(user)
    post '/api/v1/login', params: {email: user.email, password: user.password}
    return json['auth_token']
  end
end
