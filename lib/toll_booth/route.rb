module TollBooth
  class Route
    include HTTParty

    base_uri "http://maps.google.com/maps/nav"
    default_params {
      :f => "d",
      :ie => "UTF8"
      :output => "json"
    }
  end
end
