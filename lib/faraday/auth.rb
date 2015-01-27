module FaradayMiddleware
  class ServiceMonsterAuth < Faraday::Middleware

    def initialize(app, username, password)
      @app          = app
      @username     = username
      @password     = password
      @access_token = generate_access_token
    end

    def call(env)
      env[:request_headers] = env[:request_headers].merge('Authorization' => "Basic #{@access_token}")  

      @app.call env
    end

    # Generate the access_token
    # The access_token is always the Base64 encoded version of "username:password" (gets access token for the default_company)
    def generate_access_token
      token_string = "#{@username}:#{@password}"
      return Base64.strict_encode64(token_string)  
    end

  end
end