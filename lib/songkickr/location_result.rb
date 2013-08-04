module Songkickr
  # A class to represent the result hash of a Location search.
  class LocationResult < ResultSet
    def initialize(result_hash = {})
      @result_type       = "Location"
      @result_key_string = "location"

      super
    end
  end
end
