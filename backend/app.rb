require 'sinatra'

# Allows cross-origin requests
options "*" do
	response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"

	response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

	200
end

require_relative 'models.rb'
require_relative 'routes.rb'
