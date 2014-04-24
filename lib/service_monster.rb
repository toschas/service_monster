require "service_monster/version"
require File.expand_path('../service_monster/api', __FILE__)
require File.expand_path('../service_monster/client', __FILE__)


module ServiceMonster
  
  # Alias for ServiceMonster::Client.new
  #
  # @return [ServiceMonster::Client]
  def self.client(options = {})
    ServiceMonster::Client.new(options)
  end
end
