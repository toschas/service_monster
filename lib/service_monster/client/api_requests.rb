module ServiceMonster
  class Client
    module ApiRequests

      def start_authorization(app_id, request_id)
        response = get("apiRequests/#{app_id}/#{request_id}")
      end

      def complete_authorization(app_id, request_id)
        response = post("apiRequests", {appID: app_id, requestID: request_id})
      end
    end
  end
end