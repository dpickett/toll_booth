module TollBooth
  # a collection of routes received from google after requesting directions
  # if an error occurs, the collection will be empty and the errors attribute will 
  # be populated
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
