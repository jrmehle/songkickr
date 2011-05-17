module Songkickr
  class Location
    attr_accessor :city, :lat, :lng
    
    def initialize(location_hash)
      if(location_hash["city"].is_a?(String)) # location in Event
        @city = location_hash["city"]
        @lat  = location_hash["lat"]
        @lng  = location_hash["lng"]
      elsif(location_hash["city"].is_a?(Hash)) # stand-alone Location
        city_hash = location_hash["city"]
        @city = city_hash["displayName"]
        # some locations have a null lng, lat in city hash, but have non-null in metroArea hash
        @lat  = city_hash["lat"]
        @lng  = city_hash["lng"]
      end
    end
  end
end
