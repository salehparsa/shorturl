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
