module Songkickr
  # A class to represent the result hash of a Metro Area search.
  class MetroAreaResult < ResultSet
    attr_accessor :page, :total_entries, :results

    # Takes the result hash directly and parses out the page and total entries and finally passes off to the parse_results method to get the results.
    def initialize(result_hash = {})
      @result_type       = "MetroArea"
      @result_key_string = "metroArea"

      super
    end
  end
end
