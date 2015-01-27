require 'active_support/all'
require 'faraday'
require 'base64'
require 'service_monster/version'
require File.expand_path('../service_monster/configuration', __FILE__)
require File.expand_path('../service_monster/api', __FILE__)
require File.expand_path('../service_monster/client', __FILE__)


module ServiceMonster
  
  extend Configuration  
  # Alias for ServiceMonster::Client.new
  #
  # @return [ServiceMonster::Client]
  def self.client(options = {})
    ServiceMonster::Client.new(options)
  end
  
  # Delegate to Instagram::Client
  def self.method_missing(method, *args, &block)
    return super unless client.respond_to?(method)
    client.send(method, *args, &block)
  end
end
