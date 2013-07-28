module Songkickr
  module RemoteApi
    module VenueDetails
      # ==== Venue Details
      # http://www.songkick.com/developer/venue-details
      #
      # === Parameters
      #
      # * +venue_id+ - Songkick venue ID.
      def venue(venue_id)
        result = get("/venues/#{venue_id}.json")
        Songkickr::Venue.new result['resultsPage']['results']['venue']
      end
    end
  end
end
