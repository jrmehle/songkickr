module Songkickr
  class Event
    attr_accessor :type, :display_name, :location, :start, :uri, :id, :lat, :lng, :performance, :status, :venue, :tickets_uri
    
    def initialize(event_hash)
      @type         = event_hash["type"]
      @location     = Songkickr::Location.new event_hash["location"]
      @status       = event_hash["status"]
      @display_name = event_hash["displayName"]
      @venue        = Songkickr::Venue.new event_hash["venue"]
      @start        = start_hash_to_datetime event_hash["start"]
      @uri          = event_hash["uri"]
      @performance  = parse_performance event_hash["performance"]
      @id           = event_hash["id"]
      @tickets_uri = event_hash["ticketsUri"]
    end
    
    protected
    
      def start_hash_to_datetime(start_hash)
        # "start":{"time":null,"date":"2010-04-17"},
        datetime = DateTime.parse("#{start_hash["date"]} #{start_hash["time"]}")
      end
      
      def parse_performance(performance_array = nil)
        performances = []
        if performance_array
          performance_array.each do |performance|
            performances << Songkickr::Performance.new(performance)
          end
        end
        
        performances
      end
  end
end
