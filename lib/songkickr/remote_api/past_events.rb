module Songkickr
  module RemoteApi
    module PastEvents
      # ==== Artists Gigography API
      # https://www.songkick.com/developer/past-events-for-artist
      #
      # === Parameters
      # * +artist_id+ - Songkick artist_id, use artist_search to get it
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +per_page+ - Number of items on a page
      # * +page+ - Number of page
      # * +order+ - 'asc' or 'desc', 'asc' by default
      def artists_gigography(artist_id, query = {})
        result = self.class.get("/artists/#{artist_id}/gigography.json", :query => query)
        Songkickr::EventResult.new result
      end

      # ==== User’s past events (gigography)
      # https://www.songkick.com/developer/past-events-for-user
      #
      # === Parameters
      # * +username+ - A Songkick username
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +per_page+ - Number of items on a page
      # * +page+ - Number of page
      # * +order+ - 'asc' or 'desc', 'asc' by default
      def users_gigography(username, query = {})
        result = self.class.get("/users/#{username}/gigography.json", :query => query)
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
    end
  end
end
