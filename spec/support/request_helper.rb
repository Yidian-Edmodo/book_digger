module Request
  module JsonHelpers
    def json_response
      @json_response ||= JSON.parse response.body, symbolize_names: true
    end
  end

  module HeaderHelpers
    def api_authorization_helper(token)
      request.headers['Authentication'] = token
    end

    def api_response_header
      format = Mime::Type.lookup_by_extension('json')
      request.headers['Accept'] = "#{request['Accept']} #{format}"
      request.headers['Content-Type'] = format.to_s
    end
  end
end
