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
      result = self.class.get('/events.json', :query => query)
      Songkickr::EventResult.new result
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
    
    
    # Parameters - http://www.songkick.com/developer/setlists
    #
    #     event_id
    
    def concert_setlists(event_id)
      result = self.class.get("/events/#{event_id}/setlists.json")
      Songkickr::ConcertSetlistResult.new result
    end
  end
end