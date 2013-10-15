module Songkickr
  # A single event
  #
  #   {
  #     "displayName": "Vampire Weekend at O2 Academy Brixton (February 16, 2010)",
  #     "type": "Concert",
  #     "uri": "http://www.songkick.com/concerts/3037536-vampire-weekend-at-o2-academy-brixton?utm_medium=partner&utm_source=131",
  #     "venue": {
  #       "lng": -0.1187418,
  #       "displayName": "O2 Academy Brixton",
  #       "lat": 51.4681089,
  #       "id": 17522
  #     },
  #     "location": {
  #       "lng": -0.1187418,
  #       "city": "London, UK",
  #       "lat": 51.4681089
  #     },
  #     "start": {
  #       "time": "19:30:00",
  #       "date": "2010-02-16"
  #     },
  #     "performance": [{
  #       "artist": {
  #         "uri": "http://www.songkick.com/artists/288696-vampire-weekend",
  #         "displayName": "Vampire Weekend",
  #         "id": 288696,
  #         "identifier": [{"mbid": "af37c51c-0790-4a29-b995-456f98a6b8c9"}]
  #       }
  #       "displayName": "Vampire Weekend",
  #       "billingIndex": 1,
  #       "id": 5380281,
  #       "billing": "headline"
  #     }],
  #     "id": 3037536
  #   }
  #
  # http://www.songkick.com/developer/artist-search
  class Event
    attr_accessor :popularity, :type, :display_name, :location, :start, :uri, :id, :performances, :status, :venue, :tickets_uri, :series

    def initialize(event_hash)
      @popularity   = event_hash["popularity"].to_f
      @type         = event_hash["type"]
      @location     = Songkickr::Location.new event_hash["location"]
      @status       = event_hash["status"]
      @display_name = event_hash["displayName"]
      @venue        = Songkickr::Venue.new event_hash["venue"]
      @start        = start_hash_to_datetime event_hash["start"]
      @uri          = event_hash["uri"]
      @performances = parse_performance event_hash["performance"]
      @id           = event_hash["id"]
      @tickets_uri  = event_hash["ticketsUri"]
      @series       = event_hash["series"]["displayName"] if event_hash["series"] && event_hash["series"]["displayName"]
    end

    protected

      # Takes the start hash and turns in into a DateTime object.
      def start_hash_to_datetime(start_hash)
        datetime = DateTime.parse("#{start_hash["date"]} #{start_hash["time"]}")
      end

      # Builds a list of Performance objects.
      def parse_performance(performances = [])
        performances.map { |performance| Songkickr::Performance.new performance }
      end
  end
end
