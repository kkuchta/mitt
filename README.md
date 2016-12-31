# Mitt

Mitt catches http requests and prints them to standard out.  Useful for testing webhooks.

![mitt example gif](https://raw.githubusercontent.com/kkuchta/mitt/master/mitt.gif)

## Installation

    $ gem install mitt

## Usage

`mitt [port] [body]`

**port** specifies the port on localhost for mitt to listen on.  Defaults to `8080`.

**body** specifies the http response body to reply to all requests with.  Defaults to `ok`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kkuchta/mitt. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

