module FaradayMiddleware
  class ServiceMonsterAuth < Faraday::Middleware

    def initialize(app, api_key)
      @app          = app
      @api_key      = api_key
    end

    def call(env)
      env[:request_headers] = env[:request_headers].merge('Authorization' => "Basic #{@api_key}")  
      @app.call env
    end

  end
end