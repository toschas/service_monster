module FaradayMiddleware
  class ServiceMonsterAuth < Faraday::Middleware
      def call(env)

        env[:request_headers] = env[:request_headers].merge('Authorization' => "Basic #{@access_token}")  
        p env.url.query
        # p env.url.query = Faraday::Utils.parse_query(env.url.query) if env.url.query.present?
        # if env.method == :get
        # end
        
      # if env[:method] == :get or env[:method] == :delete
      #   if env[:url].query.nil?
      #     query = {}
      #   else
      #     query = Faraday::Utils.parse_query(env[:url].query)
      #   end
      # 
      #   if @access_token and not query["client_secret"]
      #     env[:url].query = Faraday::Utils.build_query(query.merge(:access_token => @access_token))
      #     env[:request_headers] = env[:request_headers].merge('Authorization' => "Token token=\"#{@access_token}\"")
      #   elsif @client_id
      #     env[:url].query = Faraday::Utils.build_query(query.merge(:client_id => @client_id))
      #   end
      # else
      #   if @access_token and not env[:body] && env[:body][:client_secret]
      #     env[:body] = {} if env[:body].nil?
      #     env[:body] = env[:body].merge(:access_token => @access_token)
      #     env[:request_headers] = env[:request_headers].merge('Authorization' => "Token token=\"#{@access_token}\"")
      #   elsif @client_id
      #     env[:body] = env[:body].merge(:client_id => @client_id)
      #   end
      # end


        @app.call env
      end
        
    def initialize(app, api_id, api_key, company_id)
      @app     = app
      @api_id  = api_id
      @api_key = api_key
      @company_id = company_id
      @access_token = generate_access_token
    end
    
    # generate the access_token
    # the access_token is always the Base64 encoded version of "api_id:api_key" (gets access token for the default_company)
    # the access_token for a company is always the Base64 encoded version of "api_id:api_key:company_id"
    def generate_access_token
      token_string = "#{@api_id}:#{@api_key}"
      token_string = "#{@api_id}:#{@api_key}:#{@company_id}" if @company_id.present?
      return Base64.strict_encode64(token_string)  
    end
    
  end
end