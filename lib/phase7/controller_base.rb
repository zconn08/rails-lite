require_relative '../phase6/controller_base'
require_relative './flash'

module Phase7
  class ControllerBase < Phase6::ControllerBase
    def flash
      @flash ||= Flash.new(@req)
    end
  end
end
