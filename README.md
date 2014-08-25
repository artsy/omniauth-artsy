# omniauth-artsy

[![Build Status](https://travis-ci.org/artsy/omniauth-artsy.svg)](https://travis-ci.org/artsy/omniauth-artsy)

Artsy OAuth2 Strategy for OmniAuth.

### Installation

Add to your Gemfile:

``` ruby
gem 'omniauth-artsy'
```

Then run `bundle install`.

### Usage

OmniAuth::Strategies::Artsy is simply a Rack middleware. Read the [OmniAuth docs](https://github.com/intridea/omniauth) for detailed instructions.

Add the middleware to a Rails app in `config/initializers/omniauth.rb`:

``` ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :artsy, ENV['ARTSY_CLIENT_ID'], ENV['ARTSY_CLIENT_SECRET']
end
```

#### Configuration

Set `ENV['ARTSY_API_URL']` to the location of the Artsy API, typically *https://api.artsy.net* in production. Defaults to *http://localhost:3000*.

### License

MIT License, see [LICENSE](LICENSE) for details.
