require_relative '../app.rb'
require 'test/unit'
require 'rack/test'
  
set :environment, :test

class AppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_index
    get '/'
    assert last_response.ok?
  end

  def get_shortcode
    get '/:shortcode'
    assert last_response.ok?
  end

end
