require 'spec_helper'

describe OmniAuth::Strategies::Artsy do
  before :each do
    @request = double('Request')
    allow(@request).to receive(:params) { {} }

    @client_id = '912831askljfd2'
    @client_secret = 'dfallksdfoads'
    @domain = 'artsy.net'
    @uid = 'asdfasdfadsfcdad'
    @name = 'Bobert Smithson'
    @email = 'email@spiraljeezey.com'

  end

  subject do
    OmniAuth::Strategies::Artsy.new(nil, @options || {}).tap do |strategy|
      allow(strategy).to receive(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct Artsy/Gravity URL' do
      expect(subject.options.client_options.site).to eq('http://localhost:3000')
    end

    it 'has correct authorize url' do
      expect(subject.options.client_options.authorize_url).to eq('/oauth2/authorize?scope=offline_access&response_type=code')
    end

    it 'has correct token_url url' do
      expect(subject.options.client_options.token_url).to eq('/oauth2/access_token?scope=offline_access&response_type=code&grant_type=authorization_code')
    end
  end

  describe 'with raw_info' do
    before :each do
      @raw_info_hash = { 'id' => @uid, 'name' => @name, 'email' => @email }
      allow(subject).to receive(:raw_info) { @raw_info_hash }
    end

    describe '#uid' do
      it 'returns the uid from raw_info' do
        expect(subject.uid).to eq(@uid)
      end
    end

    describe '#info' do
      context 'when data is present in raw info' do
        it 'returns the name' do
          expect(subject.info[:raw_info]['name']).to eq(@name)
        end
        it 'returns the email' do
          expect(subject.info[:raw_info]['email']).to eq(@email)
        end
      end
    end

    describe '#info' do
      context 'when data is present in raw info' do
        it 'returns the name' do
          expect(subject.info[:raw_info]['name']).to eq(@name)
        end
        it 'returns the email' do
          expect(subject.info[:raw_info]['email']).to eq(@email)
        end
      end
    end

  end

end
