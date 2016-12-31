class Mitt::App
  def initialize(body)
    @body = body
  end

  def call(env)
    request = Rack::Request.new(env)

    puts "--- #{request.request_method} #{request.path} ---"
    request_body = request.body.read
    puts request_body unless request_body.empty?

    ['200', {'Content-Type' => 'text/html'}, [@body]]
  end
end
