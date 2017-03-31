require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Artsy < OmniAuth::Strategies::OAuth2
      option :client_options,
             site: OmniAuth::Artsy.config.artsy_api_url,
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
        @raw_info ||= access_token.get('/api/current_user', headers: { 'X-ACCESS-TOKEN' => access_token.token }).parsed
      end
    end
  end
end
