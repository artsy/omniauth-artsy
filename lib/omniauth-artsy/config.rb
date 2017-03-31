require 'ostruct'

module OmniAuth
  module Artsy
    class << self; attr_accessor :config; end
  end
end

OmniAuth::Artsy.config = OpenStruct.new(
  artsy_api_url: ENV['ARTSY_API_URL'] || ENV['gravity_url']
)
