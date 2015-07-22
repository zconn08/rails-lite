class Flash

  def initialize(req)
    @flash = {}
    req.cookies.each do |cookie|
      p cookie
    end
  end

end
