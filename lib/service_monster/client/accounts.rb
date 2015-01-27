module ServiceMonster
  class Client
    module Accounts

      def accounts(options = {})
        response = get("accounts", options)
      end

    end
  end
end