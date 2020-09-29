# frozen_string_literal: true

require 'bundler/setup'
require 'omniauth-artsy'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.raise_errors_for_deprecations!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
