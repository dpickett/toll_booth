module TollBooth
  class RouteStep
    attr_accessor :distance, :travel_time, :latitude, :longitude, :html_description

    def description
      @html_description.gsub(/<\/?[^>]*>/, "")
    end

    class << self
      def parse(json)
        route_steps = []
        json.each do |s|
          route_step = new
          route_step.html_description = s["descriptionHtml"]
          route_step.travel_time = s["Duration"]["seconds"]
          route_step.distance  = s["Distance"]["html"]
          route_step.latitude  = s["Point"]["coordinates"][0]
          route_step.longitude = s["Point"]["coordinates"][1]

          route_steps << route_step
        end

        route_steps
      end
    end
  end
end
