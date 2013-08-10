module Songkickr
  module RemoteApi
    module EventDetails
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
    end
  end
end
