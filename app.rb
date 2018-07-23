require 'sinatra'
require 'redis'
require 'addressable/uri'
require './config.rb'

  helpers do
      include Rack::Utils
      alias_method :h, :escape_html
  end

  redis = Redis.new

  def encode_ascii(s)
      Addressable::URI.parse(s).normalize.to_s
  end

  get '/' do
    erb :index
  end

  post '/' do
    if params[:url] and not params[:url].empty?
      @shortcode = params[:context]
        encode_url = encode_ascii (params[:url])
        redis.setnx "links:#{@shortcode}", encode_url
      end
        erb :index
  end

  get '/:shortcode' do
    @url = redis.get "links:#{params[:shortcode]}"
    redirect @url || '/'
  end
