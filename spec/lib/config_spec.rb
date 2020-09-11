# frozen_string_literal: true

require 'spec_helper'

describe OmniAuth::Artsy::Config do
  describe '#configure' do
    before do
      expect(OmniAuth::Artsy).to receive(:reconfigure_strategy).once
      OmniAuth::Artsy.configure do |config|
        config.artsy_api_url = 'http://localhost:3000/api'
      end
    end
    after do
      OmniAuth::Artsy.config.reset
    end
    it 'sets token' do
      expect(OmniAuth::Artsy.config.artsy_api_url).to eq 'http://localhost:3000/api'
    end
  end
end
