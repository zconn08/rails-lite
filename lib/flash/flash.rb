require 'json'
require 'webrick'

class Flash

  def initialize(req)
    @flash = {}
    @now_hash = {}
    req.cookies.each do |cookie|
      @now_hash = JSON.parse(cookie.value) if cookie.name == "_flash"
    end
  end

  def [](key)
    @flash.merge(@now_hash)[key]
  end

  def []=(key, val)
    @flash[key] = val
  end

  def store_flash(res)
    cookie = WEBrick::Cookie.new('_flash', @flash.to_json )
    cookie.path = "/"
    res.cookies << cookie
  end

  def now
    @now_hash
  end

end
