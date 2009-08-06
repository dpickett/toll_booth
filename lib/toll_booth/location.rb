module TollBooth
  # Represents a location that you would want directions from or to
  # A location has the following attributes:
  # * description
  class Location
    attr_accessor :description

    # create a new location
    # @param description [String] address or zipcode of the location
    def initialize(description)
      @description = description
    end

    # get driving routes to the destinations specified
    # @example 
    #   @origin = TollBooth::Location.new("4 Yawkey Way, Boston, MA")
    #   @destination = TollBooth::Location.new("1 Fleetcenter Place, Boston, MA")
    #   @routes = @origin.drive_to(@destination)
    #   if @routes.found?
    #     @routes[0].distance              #distance in miles
    #     @routes[0].drive_time            #drive time in seconds
    #     @routes[0].name                  #name of route (usually specified when multiple routes are returned)
    #     @routes[0].steps                 #array of TollBooth::Steps to take
    #     @routes[0].steps[0].distance     #distance of step in miles
    #     @routes[0].steps[0].description  #summary of step
    #   else
    #     puts @routes.errors.join(",")
    #   end
    # @param destinations [TollBooth::Location, Array] a single location or list of locations to drive to
    # @return [TollBooth::RouteCollection] a collection of potential routes to specified destination(s)
    def drive_to(destinations)
      destinations = [destinations] if !destinations.is_a?(Array)

      TollBooth::Route.find(self, destinations)
    end
  end
end
