module Songkickr
  class Artist
    attr_accessor :href, :display_name
    
    def initialize(artist_hash = {})
      @href         = artist_hash["href"]
      @display_name = artist_hash["displayName"]
    end
  end
end
