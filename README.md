# Mitt

Mitt catches http requests and prints them to standard out.  Useful for testing webhooks.

```
$ mitt 9001
Mitt is listening on port 9001
--- GET / ---
--- POST / ---
some http body
--- POST / ---
another body here
--- GET /some/path/here ---
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mitt'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mitt

## Usage

`mitt [port] [body]`

**port** specifies the port on localhost for mitt to listen on.  Defaults to `8080`.

**body** specifies the http response body to reply to all requests with.  Defaults to `ok`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kkuchta/mitt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

