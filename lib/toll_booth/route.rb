module TollBooth
  class Route
    include HTTParty
    attr_accessor :name, :steps, :distance, :travel_time

    default_params(
      :output => "json"
    )
    base_uri "http://maps.google.com/maps/nav"

    class << self
      def find(origin, destinations)
        response = get("", 
          :query => {:q => "from: #{origin.description} " + 
            destinations.collect{|d| " to: #{d.description}"}.join("")}) 
        routes = parse(response)

        routes
      end

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
