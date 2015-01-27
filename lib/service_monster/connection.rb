require 'faraday_middleware'
Dir[File.expand_path('../../faraday/*.rb', __FILE__)].each{|f| require f}

module ServiceMonster
  module Connection
    private

    def connection
      options = {
        :url => "#{endpoint}#{api_version}/"
      }
      
      Faraday::Connection.new(options) do |connection|
        connection.use FaradayMiddleware::ServiceMonsterAuth, api_key
        connection.use FaradayMiddleware::Mashify
        connection.use Faraday::Response::ParseJson
        connection.adapter(adapter)
      end
    end
  end
end