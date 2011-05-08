module Songkickr
  class Remote
    include HTTParty
    base_uri 'api.songkick.com/api/3.0'
    format :json
    
    attr_reader :api_key
    
    # Get your api_key found here http://developer.songkick.com
    def initialize(api_key = nil)
      @api_key = api_key
      @api_key ||= Songkickr.api_key
      
      self.class.default_params :apikey => @api_key
    end
    
    
    # Parameters - http://www.songkick.com/developer/event-search
    #
    #     type (concert or festival)
    #     artists (events by any of the artists, comma-separated)
    #     artist_name
    #     artist_id
    #     venue_id
    #     setlist_item_name (name of a song which was played at the event – use with artist_id or artist_name)
    #     min_date
    #     max_date
    #     location - see the Songkick website for instructions on how to use the location parameter
    
    def events(query = {})
      path = extract_path_from_query(query)
      result = self.class.get("#{path}/events.json", :query => query)
      Songkickr::EventResult.new result
    end
 
    # Parameters - http://groups.google.com/group/songkick-api/browse_thread/thread/af15b9a6ad3c3513#
    #   artist_id - Songkick artist_id, use artist_search to get it
    #   min_date
    #   max_date
    #   per_page
    #   page

    def gigography (artist_id, query= {})
      result = self.class.get("/artists/#{artist_id}/gigography.json",:query=>query)
      Songkickr::EventResult.new result
    end

    # Parameters - http://www.songkick.com/developer/artist-search
    #   full_text (full text of a search)
    # returns artist

    def artist_search(query={})
        result = self.class.get("/search/artists.json?query=#{query[:artist_name]}", :query=>query)
        Songkickr::ArtistResult.new result
    end
    
    # Parameters - http://www.songkick.com/developer/events-for-user
    #
    #     attendance (all, im_going, i_might_go) - defaults to im_going
    #     type (concert or festival)
    #     artists (events by any of the artists, comma-separated)
    #     artist_name
    #     artist_id
    #     venue_id
    #     setlist_item_name (name of a song which was played at the event – use with artist_id or artist_name)
    #     min_date
    #     max_date
    #     location - see the Songkick website for instructions on how to use the location parameter
    
    def users_events(username, query = {})
      result = self.class.get("/users/#{username}/events.json", :query => query)
      Songkickr::EventResult.new result
    end
    
    # Metro Area Events (Upcoming) - http://www.songkick.com/developer/upcoming-events-for-metro-area
    
    def metro_areas_events(metro_area_id, query = {})
      result = self.class.get("/metro_areas/#{username}/calendar.json", :query => query)
      Songkickr::EventResult.new result
    end    
    
    # Parameters - http://www.songkick.com/developer/setlists
    #
    #     event_id
    
    def concert_setlists(event_id)
      result = self.class.get("/events/#{event_id}/setlists.json")
      Songkickr::ConcertSetlistResult.new result
    end
    
    private
    
    def extract_path_from_query(query = {})
      mbid = query.delete :mbid
      "/artists/mbid:#{mbid}" if mbid
    end
  end
end