module TollBooth
  # a collection of routes received from google after requesting directions
  # if an error occurs, the collection will be empty and the errors attribute will 
  # be populated
  class RouteCollection < Array
    attr_accessor :errors
    def initialize(size = 0, obj = nil)
      super
      @errors = [] 
    end

    # where routes found?
    # @return [Boolean] whether routes were found or not
    def found?
      empty?
    end
  end
end
