module Songkickr
  # metroArea: {
  #   displayName: "Twin Cities",
  #   uri: "http://www.songkick.com/metro_areas/35130-us-twin-cities?utm_source=4791&utm_medium=partner",
  #   id: 35130,
  #   state: {
  #     displayName: "MN"
  #   },
  #   country: {
  #     displayName: "US"
  #   },
  #   lat: 44.9801,
  #   lng: -93.2519
  # }
  class MetroArea
    attr_accessor :display_name, :uri, :id, :state, :country, :lat, :lng

    def initialize(metro_area_hash)
      @display_name = metro_area_hash["displayName"]
      @id           = metro_area_hash["id"]
      @uri          = metro_area_hash["uri"]
      @state        = metro_area_hash["state"]["displayName"] if metro_area_hash.include?("state") && metro_area_hash["state"].include?("displayName")
      @country      = metro_area_hash["country"]["displayName"] if metro_area_hash.include?("country") && metro_area_hash["country"].include?("displayName")
      @lat          = metro_area_hash["lat"] if metro_area_hash.include? "lat"
      @lng          = metro_area_hash["lng"] if metro_area_hash.include? "lng"
    end
  end
end
