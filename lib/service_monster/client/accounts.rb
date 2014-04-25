module ServiceMonster
  class Client
    module Accounts
      
      def accounts(options)
        response = get("accounts",options)
      end
      
      # gets an individual account
      # @endpoint /accounts/:id
      def account(account_id, options = {})
        response = get("accounts/#{account_id}",options)
      end
      
    end
  end
end