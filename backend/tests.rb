ENV['RACK_ENV'] = 'test'

require_relative 'app'
require 'test/unit'
require 'rack/test'

class BasicRouteTests < Test::Unit::TestCase
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    def test_get_homepage
        get '/'
        assert last_response.ok?
    end

    def test_login
        post '/user/login', :username => "erik", :password => "thiem"
        assert last_response.ok?
    end
end
