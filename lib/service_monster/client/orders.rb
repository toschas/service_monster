module ServiceMonster
  class Client
    module Orders

      def orders(options = {})
        response = get("orders", options)
      end

    end
  end
end