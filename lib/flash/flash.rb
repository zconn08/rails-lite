require 'json'
require 'webrick'

class Flash

  def initialize(req)
    @flash = {}
    @counter = 0
    req.cookies.each do |cookie|
      @flash = JSON.parse(cookie.value) if cookie.name == "_flash"
    end
  end

  def [](key)
    @flash[key]
  end

  def []=(key, val)
    @flash[key] = val
  end

  def store_flash
    cookie = WEBrick::Cookie.new('_flash', @flash.to_json )
    @res.cookies << cookie if @counter < 2
    @counter += 1
  end

  def self.now
    @counter += 1
  end

end
