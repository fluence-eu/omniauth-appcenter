# OmniAuth AppCenter

OmniAuth strategy for authenticating with [Fluence AppCenter](https://appcenter.fluence.eu) via OAuth2.

## Installation

Add this line to your application's Gemfile:

```ruby
source 'https://rubygems.pkg.github.com/fluence-eu' do
  gem 'omniauth-appcenter'
end
```

And then execute:

```bash
bundle install
```

## Usage

### Rails Configuration

Add the provider to your OmniAuth initializer:

```ruby
# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :app_center,
           ENV['APPCENTER_CLIENT_ID'],
           ENV['APPCENTER_CLIENT_SECRET']
end
```

### Devise Integration

If you're using Devise, add the provider to your Devise configuration:

```ruby
# config/initializers/devise.rb
Devise.setup do |config|
  config.omniauth :app_center,
                  ENV['APPCENTER_CLIENT_ID'],
                  ENV['APPCENTER_CLIENT_SECRET']
end
```

### Custom Redirect URI

You can specify a custom redirect URI:

```ruby
provider :app_center,
         ENV['APPCENTER_CLIENT_ID'],
         ENV['APPCENTER_CLIENT_SECRET'],
         redirect_uri: 'https://your-app.com/auth/app_center/callback'
```

### Auth Hash

After authentication, OmniAuth will provide the following hash:

```ruby
{
  provider: 'app_center',
  uid: '123456',
  info: {
    email: 'user@example.com'
  },
  credentials: {
    token: 'access_token',
    refresh_token: 'refresh_token',
    expires_at: 1234567890,
    expires: true
  },
  extra: {
    raw_info: {
      uid: '123456',
      email: 'user@example.com'
    }
  }
}
```

## Configuration Options

| Option | Default | Description |
|--------|---------|-------------|
| `scope` | `user` | OAuth2 scope for the authorization request |
| `redirect_uri` | OmniAuth default | Custom callback URL |

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fluence-eu/omniauth-appcenter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
