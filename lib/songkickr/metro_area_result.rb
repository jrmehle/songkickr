module Songkickr
  # A class to represent the result hash of a Metro Area search.
  class MetroAreaResult
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

    # Take the results hash directly and parse the metro areas into MetroArea objects.
    #
    # Returns an array of MetroAreas.
    def parse_results(results = {})
      metro_areas = []
      if results.include?("metroArea")
        results["metroArea"].each do |artist|
          metro_areas << Songkickr::MetroArea.new(artist)
        end
      end

      metro_areas
    end
  end
end
