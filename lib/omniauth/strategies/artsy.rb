require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Artsy < OmniAuth::Strategies::OAuth2
      option :client_options,
             site: ENV['ARTSY_API_URL'] || ENV['gravity_url'] || 'http://localhost:3000',
             authorize_url: '/oauth2/authorize?scope=offline_access&response_type=code',
             token_url: '/oauth2/access_token?scope=offline_access&response_type=code&grant_type=authorization_code'

      def request_phase
        super
      end

      uid do
        raw_info['id']
      end

      info do
        { raw_info: raw_info }
      end

      def raw_info
        # TODO: we should send the access_token with the headers,
        # but it looks like the AccessToken's get request isn't sending it over
        # as specified in the oauth gem's documentation.
        # @raw_info ||= access_token.get('/api/v1/me',{ "X-ACCESS-TOKEN" => access_token.token }).parsed
        @raw_info ||= access_token.get('/api/v1/me?access_token=' + access_token.token).parsed
      end
    end
  end
end
