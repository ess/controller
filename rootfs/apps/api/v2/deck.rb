require 'bcrypt'
require 'json'

require_relative '../deck'

module API
  module V2
    class Deck < API::Deck
      def default_headers
        super.merge(
          {
            Rack::CONTENT_TYPE => "application/json"
          }
        )
      end

      def api_error(status, body)
        res.status = status
        render(body)
      end

      def render(body)
        res.json(JSON.dump(body))
      end

      def unauthorized(message)
        api_error(
          401,
          {detail: message}
        )
      end

      def invalid_token
        unauthorized('Invalid token.')
      end

      def missing_token
        unauthorized('Authentication credentials were not provided.')
      end

      def authenticated
        token = req.get_header('HTTP_AUTHORIZATION').to_s.split(/\s+/).last
        return missing_token if token.nil?
        return invalid_token if token != 'supersekrattoken'

        true
      end
    end
  end
end
