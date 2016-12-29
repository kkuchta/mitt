require 'rack'

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

    app = Proc.new do |env|
      ['200', {'Content-Type' => 'text/html'}, [body]]
    end

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
