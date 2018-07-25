ENV['RACK_ENV'] = 'test'

require 'app' 
require 'rspec'
require 'rack/test'

describe 'Shortlink App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "/" do
    get '/'
    expect(last_response).to be_ok
  end
end
