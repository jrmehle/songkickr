module Songkickr
  module RemoteApi
    module UserEventsAndTrackings
      # ==== Users Tracked Events Calendar
      # Returns a list of calendar entries with events for a user's tracked artists in her tracked metro areas.
      # /users/#{username}/calendar.json?reason=tracked_artist
      def users_tracked_events_calendar(username)
        result = get("/users/#{username}/calendar.json?reason=tracked_artist")
        Songkickr::CalendarResult.new result
      end

      # ==== User Attendance Calendar
      # Returns a list of calendar entries with events that a user is planning to attend.
      # /users/#{username}/calendar.json?reason=attendance
      def users_attendance_calendar(username)
        result = get("/users/#{username}/calendar.json?reason=attendance")
        Songkickr::CalendarResult.new result
      end


      # ==== User Tracked Metro Areas
      # http://www.songkick.com/developer/trackings
      #
      # === Parameters
      # * +username+ - A Songkick username.
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      def users_tracked_metro_areas(username, query = {})
        result = get("/users/#{username}/metro_areas/tracked.json", :query => query)
        Songkickr::MetroAreaResult.new result
      end

      # ==== User Metro Area Tracking
      # http://www.songkick.com/developer/trackings
      #
      # === Parameters
      # * +username+ - A Songkick username.
      # * +metro_area_id+ - A Songkick metro area ID.
      # * +query+ - A hash of query parameters, see below for options.
      def users_metro_area_tracking(username, metro_area_id, query = {})
        result = get("/users/#{username}/trackings/metro_area:#{metro_area_id}.json", :query => query)
        Songkickr::MetroAreaResult.new result
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

      # ==== User Artist Tracking
      # http://www.songkick.com/developer/trackings
      #
      # === Parameters
      # * +username+ - A Songkick username.
      # * +artist_id+ - A Songkick artist ID.
      # * +query+ - A hash of query parameters, see below for options.
      def users_artist_tracking(username, artist_id, query = {})
        result = get("/users/#{username}/trackings/artist:#{artist_id}.json", :query => query)
        Songkickr::ArtistResult.new result
      end

      # ==== User Muted Artists
      # http://www.songkick.com/developer/trackings
      #
      # === Parameters
      # * +username+ - A Songkick username.
      # * +query+ - A hash of query parameters, see below for options.
      #
      # ==== Query Parameters
      # * +page+ - Page number
      # * +per_page+ - Number of results per page, max 50.
      def users_muted_artists(username, query = {})
        result = get("/users/#{username}/artists/muted.json", :query => query)
        Songkickr::ArtistResult.new result
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

      # ==== User Attendance
      # http://www.songkick.com/developer/trackings
      #
      # === Parameters
      # * +username+ - A Songkick username.
      # * +event_id+ - A Songkick event/concert ID.
      # * +query+ - A hash of query parameters, see below for options.
      def users_attendance(username, event_id, query = {})
        result = get("/users/#{username}/trackings/event:#{event_id}.json", :query => query)
        Songkickr::TrackingResult.new result
      end
    end
  end
end
