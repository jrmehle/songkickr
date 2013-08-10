module Songkickr
  # A class to represent the result hash of an Event search.
  class EventResult < ResultSet

    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      @result_type       = "Event"
      @result_key_string = "event"

      super
    end
  end
end
