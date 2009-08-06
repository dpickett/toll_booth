module TollBooth
  class Route
    include HTTParty
    attr_accessor :name, :steps, :distance, :travel_time

    default_params(
      :output => "json"
    )
    base_uri "http://maps.google.com/maps/nav"

    class << self
      # get driving directions from the origin to the specified destination(s)
      # @param origin [TollBooth::Location] the starting point for the trip
      # @param destinations [Array] a list of destinations to drive to
      # @return [TollBooth::RouteCollection] a list of potential routes for the trip
      def find(origin, destinations)
        response = get("", 
          :query => {:q => "from: #{origin.description} " + 
            destinations.collect{|d| " to: #{d.description}"}.join("")}) 
        routes = parse(response)

        routes
      end

      # parses response from google
      # @param the response received from google
      # @return [TollBooth::RouteCollection] returns a route collection based on the request
      def parse(response)
        resp = JSON.parse(response.body)

        code = response["Status"]["code"] 
        routes = TollBooth::RouteCollection.new
        if code == 200
          resp["Directions"]["Routes"].each do |r|
            route = new 
            route.distance = r["Distance"]["html"].gsub("&nbsp;mi", "").to_f
            route.travel_time = ChronicDuration.parse(r["Duration"]["html"])
            route.steps = TollBooth::RouteStep.parse(r["Steps"])

            routes << route
          end 

        else
          routes.errors = [error_for(code)]
        end
        routes
      end

      private
      # get a friently error message for the status code specified
      # @param code [Integer] code to translate
      # @return [String] a friendly error message
      def error_for(code)
        if code == 602
          "Bad Address Specified"
        elsif code == 500
          "Server Error"
        end
      end
    end
  end
end
