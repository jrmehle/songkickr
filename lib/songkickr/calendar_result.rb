module Songkickr
  class CalendarResult < ResultSet
    def initialize(result_hash = {})
      @result_type       = "CalendarEntry"
      @result_key_string = "calendarEntry"

      super
    end
  end
end
