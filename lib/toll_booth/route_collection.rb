module TollBooth
  class RouteCollection < Array
    attr_accessor :errors
    def initialize(size = 0, obj = nil)
      @errors = [] 
    end

    def found?
      empty?
    end
  end
end
