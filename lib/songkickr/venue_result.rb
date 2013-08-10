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

  class VenueResult < ResultSet
    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      @result_type       = "Venue"
      @result_key_string = "venue"

      super
    end
  end
end
