# frozen_string_literal: true

module OmniAuth
  module Artsy
    module Config
      extend self

      attr_accessor :artsy_api_url

      def reset
        self.artsy_api_url = nil
      end

      reset
    end

    class << self
      def configure
        if block_given?
          yield(Config)
          reconfigure_strategy
        end
        Config
      end

      def reconfigure_strategy
        Strategies::Artsy.configure
      end

      def config
        Config
      end
    end
  end
end
