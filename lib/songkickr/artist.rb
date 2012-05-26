module Songkickr
  # A single artist
  #
  #  {
  #   "uri":"http://www.songkick.com/artists/253846-radiohead",
  #   "displayName":"Radiohead",
  #   "id":253846,
  #   "onTourUntil":"2010-01-01"
  #  }
  #
  # http://www.songkick.com/developer/artist-search
  class Artist
    attr_accessor :uri, :display_name, :id, :on_tour_until

    # Accepts a hash of artist attributes.
    def initialize(artist_hash = {})
      @uri           = artist_hash["uri"]
      @display_name  = artist_hash["displayName"]
      @id            = artist_hash["id"]
      @on_tour_until = artist_hash["onTourUntil"]
    end
  end
end
