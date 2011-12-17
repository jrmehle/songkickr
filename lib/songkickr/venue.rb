module Songkickr
  class Venue
    attr_accessor :display_name, :id, :lat, :lng

    def initialize(venue_hash)
      @display_name = venue_hash["displayName"]
      @id           = venue_hash["id"]
      @lat          = venue_hash["lat"]
      @lng          = venue_hash["lng"]
    end
  end
end
