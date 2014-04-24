module ServiceMonster
  module Configuration
    
    VALID_OPTIONS_KEYS = [
      :api_id,
      :api_key,
      :company_id
    ].freeze
    
    
    DEFAULT_ENDPOINT = 'https://api.servicemonster.com/v1/'.freeze
    
    DEFAULT_FORMAT = :json
    
    attr_accessor *VALID_OPTIONS_KEYS
    
    # Convenience method to allow configuration options to be set in a block
    def configure
      yield self
    end

  end
end