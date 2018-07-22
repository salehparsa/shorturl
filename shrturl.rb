require 'sinatra'
require 'redis'
require 'yaml'

class Config
  attr_reader :server

  def initialize(file = YAML.load_file("config.yml"))
    @base_url = file["server"]
  end

  def uri
    URI("#{base_url}".strip)
  end

end

=begin
class Shorten

  attr_reader :config

  def initialize(config = Config.new)
    @config = config
  end
=end

  redis = Redis.new
  helpers do
      include Rack::Utils
      alias_method :h, :escape_html
  end

  get '/' do
    erb :index
  end

  post '/' do
      if params[:url] and not params[:url].empty?
        @shortcode = params[:context]
          redis.setnx "links:#{@shortcode}", params[:url]
        end
        erb :index
  end

  get '/:shortcode' do
      @url = redis.get "links:#{params[:shortcode]}"
      redirect @url || '/'
  end


#end

#Shorten.new
