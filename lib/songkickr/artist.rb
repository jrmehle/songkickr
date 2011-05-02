module Songkickr
  class Artist
    attr_accessor :href, :display_name, :id
    
    def initialize(artist_hash = {})
      @href         = artist_hash["href"]
      @display_name = artist_hash["displayName"]
      @id			= artist_hash["id"]
    end
  end
end
