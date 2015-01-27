module ServiceMonster
  module Configuration
    
    VALID_OPTIONS_KEYS = [
      :username,
      :password,
      :api_version,
      :adapter,
      :endpoint
    ].freeze

    # By default don't set the username.
    DEFAULT_USERNAME = nil

    # By default don't set the password.
    DEFAULT_PASSWORD = nil

    # By default use V1 of the API.
    DEFAULT_API_VERSION = '/v1'.freeze

    # Use the default Faraday adapter.
    DEFAULT_ADAPTER = Faraday.default_adapter
    
    # By default use the main Service Monster api URL.
    DEFAULT_ENDPOINT = 'https://api.servicemonster.net'.freeze

    # By default request JSON data to be returned from the API.
    DEFAULT_FORMAT = :json

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

    # When this module is extended, reset all settings.
    def self.extended(base)
      base.reset
    end
    
    # Reset all configuration settings to default values.
    def reset
      self.username    = DEFAULT_USERNAME
      self.password    = DEFAULT_PASSWORD
      self.api_version = DEFAULT_API_VERSION
      self.endpoint    = DEFAULT_ENDPOINT
      self.adapter     = DEFAULT_ADAPTER
    end
  end
end
