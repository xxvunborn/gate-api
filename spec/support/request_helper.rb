module Requests
  module JsonHelpers
    def response_body_to_json
      @json ||= JSON.parse(response.body)
    end
  end
end
