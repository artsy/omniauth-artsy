$LOAD_PATH.unshift File.expand_path(__dir__)
$LOAD_PATH.unshift File.expand_path('../lib', __dir__)

require 'omniauth-artsy'
require 'rspec'
require 'webmock/rspec'

RSpec.configure(&:raise_errors_for_deprecations!)
