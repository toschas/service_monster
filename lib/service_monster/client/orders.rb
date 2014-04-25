module ServiceMonster
  class Client
    module Orders
      
      def orders(account_id)
        response = get("accounts/#{account_id}/orders",{})
      end
      
    end
  end
end