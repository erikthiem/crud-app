require 'sinatra'

use Rack::Session::Cookie, :key => 'rack.session',
                           :path => '/',
                           :secret => 'abc'

# Allows cross-origin requests
options "*" do
    
	response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"

	response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept, Authorization, Origin"

    response.headers["Access-Control-Allow-Methods"] = "POST, GET, OPTIONS, PUT, DELETE"

	200
end

require_relative 'models.rb'
require_relative 'routes.rb'
