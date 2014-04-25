module ServiceMonster
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options={})
      request(:get, path, options)
    end


    private

    # Perform an HTTP request
    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get
          request.url(path,options)
        end
      end
      
      p response.body
    end
    


  end
end