
module Songkickr
  # A class to represent the result hash of a Venue search.

  # {"resultsPage":
  #   {"results":
  #     {"venue":
  #       [{"id":17522,
  #         "displayName":"O2 Academy Brixton",
  #         "city":{"uri":"http://www.songkick.com/metro_areas/24426-uk-london",
  #                 "displayName":"London","country":{"displayName":"UK"},"id":24426},
  #         "metroArea":{"uri":"http://www.songkick.com/metro_areas/24426-uk-london",
  #                      "displayName":"London","country":{"displayName":"UK"},"id":24426},
  #         "uri":"http://www.songkick.com/venues/17522-o2-academy-brixton",
  #         "street":"211 Stockwell Road", "zip":"SW9 9SL",
  #         "lat":51.4651268, "lng":-0.115187,
  #         "phone":"020 7771 3000",
  #         "website":"http://www.brixton-academy.co.uk",
  #         "capacity":4921,
  #         "description": "Brixton Academy is an award winning music venue situated in the heart of Brixton, South London."
  #       } ]
  #     },"totalEntries":1,"perPage":50,"page":1,"status":"ok"}}

  #TODO: very similar to concert_setlist_result, event_result, and artist_result, extract common stuff to module/superclass
  class VenueResult
    attr_accessor :page, :total_entries, :results

    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      results_page = result_hash["resultsPage"]

      if results_page
        @page          = results_page["page"]
        @total_entries = results_page["totalEntries"]
        @results       = parse_results results_page["results"]
      end
    end


    protected

      # Take the results hash directly and parse the locations into Location objects.
      #
      # Returns an array of Locations.
      def parse_results(results = {})
        locations = []
        if results.include?("venue")
          results["venue"].each do |location|
            locations << Songkickr::Venue.new(location)
          end
        end

        locations
      end
  end
end
