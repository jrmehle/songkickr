module Songkickr
  # Create an instance of the remote class to interact with the Songkick API.
  class Remote
    include HTTParty
    base_uri 'api.songkick.com/api/3.0'
    format :json

    attr_reader :api_key

    # ==== Create a new instance of the remote class to talk to Songkick
    # Get an API key for your app from http://developer.songkick.com/
    def initialize(api_key = nil)
      @api_key = api_key
      @api_key ||= Songkickr.api_key

      self.class.default_params :apikey => @api_key
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
      path = extract_path_from_query(query)
      result = get("#{path}/events.json", :query => query)
      Songkickr::EventResult.new result
    end

    # ==== Event API
    # http://www.songkick.com/developer/upcoming-events
    #
    # Getting detailed information of a single event.
    #
    # === Parameters
    # * +event_id+ - Songkick event ID. Extract the event ID either from a previous API call or from the URL of the event page on the website.
    def event(event_id)
      result = get("/events/#{event_id}.json")
      Songkickr::Event.new result["resultsPage"]["results"]["event"]
    end

    # ==== Gigography API
    # http://groups.google.com/group/songkick-api/browse_thread/thread/af15b9a6ad3c3513#
    #
    # === Parameters
    # * +artist_id+ - Songkick artist_id, use artist_search to get it
    # * +query+ - A hash of query parameters, see below for options.
    #
    # ==== Query Parameters
    # * +min_date+ - Oldest date for which you want to look for events
    # * +max_date+ - Most recent date for which you want to look for events
    # * +per_page+ - Number of items on a page
    # * +page+ - Number of page
    def gigography(artist_id, query= {})
      result = get("/artists/#{artist_id}/gigography.json",:query=>query)
      Songkickr::EventResult.new result
    end

    # === Artist API
    # Undocumented, but it works fine
    #
    # Returns an artist object
    #
    # === Parameters
    #  * +artist_id+ - Songkick artist_id, use artist_search to get it
    def artist(artist_id)
      result = get("/artists/#{artist_id}.json")
      Songkickr::Artist.new result["resultsPage"]["results"]["artist"]
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
    def artist_search(query={})
      result = get("/search/artists.json", :query => query)
      Songkickr::ArtistResult.new result
    end

    # ==== Artist calendar (Upcoming)
    # Returns an array of Events.
    #
    # http://www.songkick.com/developer/upcoming-events-for-artist
    #
    # === Parameters
    # * +artist_id+ - Songkick unique ID for artist. Use artist_search to find an artist ID.
    # * +query+ - A hash of query parameters, see below for options.
    #
    # ==== Query Parameters
    # * +page+ - Page number
    # * +per_page+ - Number of results per page, max 50.
    def artist_events(artist_id, query = {})
      result = get("/artists/#{artist_id}/calendar.json", :query => query)
      Songkickr::EventResult.new result
    end

    # ==== User Events API
    # http://www.songkick.com/developer/upcoming-events-for-user
    #
    # === Parameters
    # * +username+ - A Songkick username.
    # * +query+ - A hash of query parameters, see below for options.
    #
    # ==== Query Parameters
    # * +attendance+ (all, im_going, i_might_go) - defaults to im_going
    # * +type+ (concert or festival)
    # * +artists+ (events by any of the artists, comma-separated)
    # * +artist_id+ - Songkick unique ID for an artist
    # * +venue_id+ - Songkick unique ID for a venue
    # * +setlist_item_name+ (name of a song which was played at the event – use with artist_id or artist_name)
    # * +min_date+ - Oldest date for which you want to look for events
    # * +max_date+ - Most recent date for which you want to look for events
    # * +location+ - see the Songkick website for instructions on how to use the location parameter
    def users_events(username, query = {})
      result = get("/users/#{username}/events.json", :query => query)
      Songkickr::EventResult.new result
    end

    # ==== User Tracked Artists
    # http://www.songkick.com/developer/trackings
    #
    # === Parameters
    # * +username+ - A Songkick username.
    # * +query+ - A hash of query parameters, see below for options.
    #
    # ==== Query Parameters
    # * +page+ - Page number
    # * +per_page+ - Number of results per page, max 50.
    def users_tracked_artists(username, query = {})
      result = get("/users/#{username}/artists/tracked.json", :query => query)
      Songkickr::ArtistResult.new result
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

    # ==== Concert Setlists API
    # http://www.songkick.com/developer/setlists
    #
    # === Parameters
    #
    # * +event_id+ - Songkick event ID. Extract the event ID either from a previous API call or from the URL of the event page on the website.
    def concert_setlists(event_id)
      result = get("/events/#{event_id}/setlists.json")
      Songkickr::ConcertSetlistResult.new result
    end

    # ==== Location Search API
    # http://www.songkick.com/developer/location-search
    #
    # === Parameters
    # * +query+ - A hash of query parameters, see below for options.
    #
    # ==== Query Parameters
    # * +location+ - 'geo:{lat,lng}' string <em>Ex. 'geo:{-0.128,51.5078}'</em>
    def location_search(query = {})
      result = get("/search/locations.json", :query => query)
      Songkickr::LocationResult.new result
    end

    # ==== Venue Search
    # http://www.songkick.com/developer/venue-details
    #
    # === Parameters
    #
    # * +venue_id+ - Songkick venue ID.
    def venue(venue_id)
      result = get("/venues/#{venue_id}.json")
      Songkickr::Venue.new result['resultsPage']['results']['venue']
    end

    def get(location, query_params = {})
      result = self.class.get(location, query_params)
      # FIXME: this is shit. should be based on on http response.
      if result['resultsPage']['error']
        msg = result['resultsPage']['error']['message']
        raise ResourceNotFound if msg =~ /not found/
        raise APIError.new(msg)
      end
      result
    end


    private

      # Given a query, look for an mbid key and return a path to access it.
      def extract_path_from_query(query = {})
        mbid = query.delete :mbid
        "/artists/mbid:#{mbid}" if mbid
      end
  end
end
