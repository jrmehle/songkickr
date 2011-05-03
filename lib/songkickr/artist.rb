module Songkickr
  class Artist
    attr_accessor :href, :display_name, :id, :uri, :onTourUntil
    
    def initialize(artist_hash = {})
      @href         = artist_hash["href"]
      @display_name = artist_hash["displayName"]
      @id			= artist_hash["id"]
      @uri 			= artist_hash["uri"]
      @onTourUntil	= artist_hash["onTourUntil"]
    end
  end
end
