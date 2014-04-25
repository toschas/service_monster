module ServiceMonster
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}
    
    include ServiceMonster::Client::Accounts
  end
end