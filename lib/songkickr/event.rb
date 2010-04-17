module Songkickr
  class Event
    attr_accessor :type, :display_name, :location, :start, :uri, :id, :lat, :lng, :performance, :status, :venue, :tickets_uri
    
    def initialize(event_hash)
      @type         = event_hash["type"]
      @location     = Songkickr::Location.new event_hash["location"]
      @status       = event_hash["status"]
      @display_name = event_hash["displayName"]
      @venue        = Songkickr::Venue.new event_hash["venue"]
      @start        = event_hash["start"]
      @uri          = event_hash["uri"]
      @performance  = event_hash["performance"]
      @id           = event_hash["id"]
      @tickets_uri = event_hash["ticketsUri"]
    end
  end
end
