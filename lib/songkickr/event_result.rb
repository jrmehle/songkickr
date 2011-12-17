module Songkickr
  # A class to represent the result hash of an Event search.
  class EventResult
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

      def parse_results(results = {})
        events = []
        if results.include?("event")
          results["event"].each do |event|
            events << Songkickr::Event.new(event)
          end
        end

        events
      end
  end
end
