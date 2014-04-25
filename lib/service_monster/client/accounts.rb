module ServiceMonster
  class Client
    module Accounts
      
      def account(*options)
        response = get("accounts",options)
      end
      
    end
  end
end