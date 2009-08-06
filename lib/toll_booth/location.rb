module TollBooth
  class Location
    attr_accessor :description

    def initialize(description)
      @description = description
    end

    def drive_to(destinations)
      destinations = [destinations] if !destinations.is_a?(Array)

      TollBooth::Route.find(self, destinations)
    end
  end
end
