module ServiceMonster
  # Defines HTTP request methods
  module Request
    # Perform an HTTP GET request
    def get(path, options = {})
      request(:get, path, options)
    end

    # Perform an HTTP POST request
    def post(path, options = {})
      request(:post, path, options)
    end

    private

    # Perform an HTTP request
    def request(method, path, options)
      response = connection.send(method) do |request|
        case method
        when :get
          formatted_options = format_options(options)
          request.url(path,formatted_options)
        when :post, :put
          request.headers['Content-Type'] = 'application/json'
          request.body = options.to_json unless options.empty?
          request.url(path)
        end
      end
      
      Response.create(response.body)
    end
    
    # Format the Options before you send them off to ServiceMonster
    def format_options(options)
      return if options.blank?
      options[:fields]     = format_fields(options[:fields]) if options.has_key?(:fields)
      options[:limit]      = options[:limit] if options.has_key?(:limit)
      options[:pageindex]  = options[:page]  if options.has_key?(:page)
      options[:q]          = options[:q]  if options.has_key?(:q)
      options[:wField]     = options[:wField] if options.has_key?(:wField)
      options[:wOperator]  = options[:wOperator] if options.has_key?(:wOperator)
      options[:wValue]     = options[:wValue] if options.has_key?(:wValue)

      return options
    end
    
    # format the fields to a format that the ServiceMonster likes
    # @param [Array or String] fields can be specified as an Array or String
    # @return String
    def format_fields(fields)
      if fields.instance_of?(Array)
        return fields.join(",")
      elsif fields.instance_of?(String)
        return fields
      end
    end
      
  end
end