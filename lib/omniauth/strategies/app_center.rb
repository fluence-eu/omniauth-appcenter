# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    # Main class for Fluence OAuth2 strategy.
    class AppCenter < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = 'user'

      option :name, 'app_center'
      option :scope, DEFAULT_SCOPE
      option :client_options,
             site: 'https://appcenter.fluence.eu',
             authorize_url: '/oauth/authorize',
             token_url: '/oauth/token'
      option :provider_ignores_state, true

      uid { raw_info['uid'] }

      info do
        {
          'email' => raw_info['email']
        }
      end

      extra do
        hash = {}
        hash['raw_info'] = raw_info unless skip_info?
        hash
      end

      def raw_info
        @raw_info ||= access_token.get('api/v1/me').parsed || {}
      end

      def authorize_params
        super.tap do |params|
          params[:scope] ||= DEFAULT_SCOPE
        end
      end

      def callback_url
        options[:redirect_uri] || super
      end
    end
  end
end
