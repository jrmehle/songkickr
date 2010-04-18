module Songkickr
  class Performance
    attr_accessor :artist, :display_name, :id
    
    def initialize(performance_hash)
      @artist       = Songkickr::Artist.new performance_hash["artist"]
      @display_name = performance_hash["displayName"]
      @id           = performance_hash["id"]
    end
  end
end
