module Songkickr
  class Event
    attr_accessor :type, :display_name, :location, :start, :uri, :id, :lat, :lng, :performance, :status, :venue
    
    def initialize(event_hash)
      @type         = event_hash["type"]
      @location     = event_hash["location"]
      @status       = event_hash["status"]
      @display_name = event_hash["display_name"]
      @venue        = event_hash["venue"]
      @start        = event_hash["start"]
      @uri          = event_hash["uri"]
      @performance  = event_hash["performance"]
      @id           = event_hash["id"]
    end
  end
end
