module Songkickr
  module RemoteApi
    module UpcomingEvents
      # ==== Artist calendar (Upcoming)
      # Returns an array of Events.
      #
      # ex. remote.artist_events('mbid:5bac9b4f-2f1c-4d39-8d11-231d5b6650ce', :page => 1, :per_page => 5, :order => 'desc')
      #
      # http://www.songkick.com/developer/upcoming-events-for-artist
      #
      # === Parameters
      # * +artist_id_or_music_brainz_id+ - Songkick unique ID for artist. Use artist_search to find an artist ID. Or a MusicBrainz.org id string. ex. mbid:5bac9b4f-2f1c-4d39-8d11-231d5b6650ce
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      # * +order+ - Results are sorted by date. The order can be specified with: order ('asc' or 'desc', 'asc' by default).
      def artist_events(artist_id_or_music_brainz_id, query = {})
        if artist_id_or_music_brainz_id.to_s.match /^mbid\:\d+$/
          url = "/artists/mbid:#{artist_id_or_music_brainz_id}/calendar.json"
        else
          url = "/artists/#{artist_id_or_music_brainz_id}/calendar.json"
        end

        result = get(url, :query => query)
        Songkickr::EventResult.new result
      end

      # ==== Artist Search API
      # Returns Artist objects.
      #
      # http://www.songkick.com/developer/artist-search
      #
      # === Parameters
      # * +query+ - Search for artists by name using full text search. Results from Songkick are returned by relevancy.
      #
      # ==== Query Parameters
      # * +artist_name+ - Name of an artist. <em>Ex. 'Lady Gaga', 'Slayer', 'Atmosphere'</em>
      def artist_search(query = {})
        result = self.class.get("/search/artists.json", :query => { :query => query })
        Songkickr::ArtistResult.new result
      end

      # ==== Event Search API
      # http://www.songkick.com/developer/event-search
      #
      # === Parameters
      # * +query+ - A hash of query parameters, see below for options.
      #
      # _Example:_ <code>{ :type => 'concert', :artists => 'Coolio' }</code>
      #
      # ==== Query Parameters
      # * +type+ - valid types: concert or festival
      # * +artists+ - events by any of the artists, comma-separated
      # * +artist_name+ - plain text name of artist ex. 'As I Lay Dying', 'Parkway Drive', 'Animals As Leaders'
      # * +artist_id+ - Songkick unique ID for an artist
      # * +venue_id+ - Songkick unique ID for a venue
      # * +setlist_item_name+ - name of a song which was played at the event – use with artist_id or artist_name
      # * +min_date+ - Oldest date for which you want to look for events
      # * +max_date+ - Most recent date for which you want to look for events
      # * +location+ - See the Songkick website for instructions on how to use the location parameter http://www.songkick.com/developer/location-search
      def events(query = {})
        result = get("/events.json", :query => query)
        Songkickr::EventResult.new result
      end

      # ==== Location Search API
      # http://www.songkick.com/developer/location-search
      #
      # === Parameters
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +name+ - Metro area or city named 'location_name' string <em>Ex. 'Minneapolis, Nashville, or London'</em>
      # * +location+ - 'geo:{lat,lng}' string <em>Ex. 'geo:{-0.128,51.5078}'</em>
      # * +ip+ - 'ip:{ip-addr}' string <em>Ex. 'ip:{123.123.123.123}'</em>
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      def location_search(query = {})
        result = get("/search/locations.json", :query => { :query => query })
        Songkickr::LocationResult.new result
      end

      # ==== Metro Area Events (Upcoming)
      # Returns an array of Events.
      #
      # http://www.songkick.com/developer/upcoming-events-for-metro-area
      #
      # === Parameters
      # * +metro_area_id+ - Songkick unique ID for metro areas. Use location_search to find a metro area ID.
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      def metro_areas_events(metro_area_id, query = {})
        result = get("/metro_areas/#{metro_area_id}/calendar.json", :query => query)
        Songkickr::EventResult.new result
      end

      # ==== Venue Calendar
      # https://www.songkick.com/developer/upcoming-events-for-venue
      #
      # === Parameters
      #
      # * +venue_id+ - Songkick venue ID.
      def venue_calendar(venue_id)
        result = get("/venues/#{venue_id}/calendar.json")
        Songkickr::EventResult.new result
      end

      # ==== Venue Search
      # https://www.songkick.com/developer/venue-search
      #
      # === Parameters
      #
      # * +query+ -
      def venue_search(query)
        result = get("/search/venues.json", :query => { :query => query })
        Songkickr::VenueResult.new result
      end
    end
  end
end
