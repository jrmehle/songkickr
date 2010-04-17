module Songkickr
  class Location
    attr_accessor :city, :lat, :lng
    
    def initialize(location_hash)
      @city = location_hash["city"]
      @lat  = location_hash["lat"]
      @lng  = location_hash["lng"]
    end
  end
end
