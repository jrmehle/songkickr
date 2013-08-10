module Songkickr
  # A class to represent the result hash of an Setlist search.
  #
  # http://www.songkick.com/developer/setlists
  class ConcertSetlistResult < ResultSet
    # Takes the result ash and passes it to parse_results
    def initialize(result_hash = {})
      @result_type       = "Setlist"
      @result_key_string = "setlist"

      super
    end
  end
end
