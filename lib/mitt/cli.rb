require 'rack'
require 'thin'

class InvalidArguments < StandardError; end

class Mitt::CLI
  def initialize(arguments)
    @arguments = arguments
  end

  def run
    if help_command?
      print_usage
      return
    end

    port, body = read_args

    app = Mitt::App.new(body)

    # Suppress thin's normal startup message
    Thin::Logging.silent = true

    puts "Mitt is listening on port #{port}"

    Rack::Handler::Thin.run app, Port: port
  rescue InvalidArguments
    print_usage
  end

  private

  def help_command?
    @arguments.any? { |arg| arg =~ /-+help/ }
  end

  def read_args
    port = (@arguments[0] || 8080).to_i
    raise InvalidArguments unless port > 0

    body = @arguments[1] || 'ok'

    [port, body]
  end

  def print_usage
    puts <<USAGE
Usage: mitt [port] [body]

port: The port to listen on.  You may need to run mitt with sudo to listen on a port reserved by your system.  Defaults to 8080.

body: The http response body used for all requests.  Defaults to 'ok'.
USAGE
  end
end
