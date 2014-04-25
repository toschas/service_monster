module ServiceMonster
  module Configuration
    
    VALID_OPTIONS_KEYS = [
      :api_id,
      :api_key,
      :company_id,
      :adapter,
      :endpoint
    ].freeze
    
    
    DEFAULT_ENDPOINT = 'http://api.servicemonster.net/v1/'.freeze
    
    DEFAULT_FORMAT = :json
    
    DEFAULT_ADAPTER = Faraday.default_adapter
    
    attr_accessor *VALID_OPTIONS_KEYS
    
    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end
    
    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end
    
    def self.extended(base)
      base.reset
    end
    
        
    def reset
      self.api_id = nil
      self.api_key = nil
      self.company_id = nil
      self.endpoint = DEFAULT_ENDPOINT
      self.adapter = DEFAULT_ADAPTER
    end
    

  end
end