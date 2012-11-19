module Songkickr
  # A class to represent the hash of a Location.
  #
  #   {
  #     "city":{
  #       "displayName":"London",
  #       "country":{
  #         "displayName":"UK"},
  #         "lng":-0.128,
  #         "lat":51.5078
  #       },
  #       "metroArea":{
  #         "uri":"http://www.songkick.com/metro_areas/24426-uk-london",
  #         "displayName":"London",
  #         "country":{  "displayName":"UK" },
  #         "id":24426,
  #         "lng":-0.128,
  #         "lat":51.5078
  #       }
  #     }
  #   }
  #
  # http://www.songkick.com/developer/location-search
  class Location
    attr_accessor :city, :lat, :lng, :metro_area
    
    # Takes a location hash. Handles the different city hashes from Event and Location
    def initialize(location_hash)
      if location_hash["city"].is_a?(String) # location in Event
        @city = location_hash["city"]
        @lat  = location_hash["lat"]
        @lng  = location_hash["lng"]
      elsif location_hash["city"].is_a?(Hash) # stand-alone Location
        city_hash = location_hash["city"]
        @city = city_hash["displayName"]
        # some locations have a null lng, lat in city hash, but have non-null in metroArea hash
        @lat  = city_hash["lat"]
        @lng  = city_hash["lng"]
      end
      
      @metro_area = location_hash['metroArea']
    end
  end
end
