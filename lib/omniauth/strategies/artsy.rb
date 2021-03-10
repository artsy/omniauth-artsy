# frozen_string_literal: true

require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Artsy < OmniAuth::Strategies::OAuth2
      def self.configure
        option :client_options,
               site: OmniAuth::Artsy.config.artsy_api_url || ENV['ARTSY_API_URL'] || ENV['gravity_url'],
               authorize_url: '/oauth2/authorize?scope=offline_access&response_type=code',
               token_url: '/oauth2/access_token?scope=offline_access&response_type=code&grant_type=authorization_code'
        # TODO: Allow GET requests to redirect to /auth/artsy for now, which exposes us
        # to CSRF attacks. We'll want to change the auth redirect behavior to a POST
        # request at some point in the future.
        # https://github.com/omniauth/omniauth/wiki/Resolving-CVE-2015-9284
        OmniAuth.config.allowed_request_methods = %i[post get] if OmniAuth.config.respond_to?(:allowed_request_methods=)
        OmniAuth.config.silence_get_warning = true if OmniAuth.config.respond_to?(:silence_get_warning=)
      end

      configure

      uid do
        raw_info['id']
      end

      info do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/current_user', headers: { 'X-ACCESS-TOKEN' => access_token.token }).parsed
      end

      alias old_request_phase request_phase

      def request_phase
        if session.id && !session.id.empty?
          options[:authorize_params] ||= {}
          options[:authorize_params].merge!(original_session_id: session.id)
        end
        old_request_phase
      end
    end
  end
end
