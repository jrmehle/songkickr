module Songkickr
  class Venue
    attr_accessor :capacity, :display_name, :description, :id, :lat, :lng, :phone, :street, :uri, :website, :zip

    def initialize(venue_hash)
      @capacity     = venue_hash["capacity"]
      @display_name = venue_hash["displayName"]
      @description  = venue_hash["description"]
      @id           = venue_hash["id"]
      @lat          = venue_hash["lat"]
      @lng          = venue_hash["lng"]
      @metro_area   = Songkickr::MetroArea.new venue_hash["metroArea"]
      @phone        = venue_hash["phone"]
      @street       = venue_hash["street"]
      @uri          = venue_hash["uri"]
      @website      = venue_hash["website"]
      @zip          = venue_hash["zip"]
    end
  end
end
