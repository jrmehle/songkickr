module Songkickr
  class Artist
    attr_accessor :href, :display_name
    
    def initialize(artist_hash)
      @href        = artist_hash["href"]
      @displayName = artist_hash["displayName"]
    end
  end
end
