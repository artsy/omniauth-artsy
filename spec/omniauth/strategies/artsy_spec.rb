require 'spec_helper'

describe OmniAuth::Strategies::Artsy do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }

    @client_id = '912831askljfd2'
    @client_secret = 'dfallksdfoads'
    @domain = "artsy.net"
    @uid = 'asdfasdfadsfcdad'
    @name = "Bobert Smithson"
    @email = "email@spiraljeezey.com"

  end

  subject do
    OmniAuth::Strategies::Artsy.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct Artsy/Gravity URL' do
      subject.options.client_options.site.should eq('http://localhost:3000')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('/oauth2/authorize?scope=offline_access&response_type=code')
    end

    it 'has correct token_url url' do
      subject.options.client_options.token_url.should eq('/oauth2/access_token?scope=offline_access&response_type=code&grant_type=authorization_code')
    end
  end

  describe "with raw_info" do
    before :each do
      @raw_info_hash = { "id" => @uid, "name" => @name, "email" => @email }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    describe '#uid' do
      it 'returns the uid from raw_info' do
        subject.uid.should eq(@uid)
      end
    end

    describe '#info' do
      context 'when data is present in raw info' do
        it 'returns the name' do
          subject.info[:raw_info]["name"].should eq(@name)
        end
        it 'returns the email' do
          subject.info[:raw_info]["email"].should eq(@email)
        end
      end
    end

    describe '#info' do
      context 'when data is present in raw info' do
        it 'returns the name' do
          subject.info[:raw_info]["name"].should eq(@name)
        end
        it 'returns the email' do
          subject.info[:raw_info]["email"].should eq(@email)
        end
      end
    end

  end

end
