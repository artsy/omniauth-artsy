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
        block_given? ? yield(Config) : Config
      end

      def config
        Config
      end
    end
  end
end
