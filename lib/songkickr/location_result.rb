module Songkickr
  # A class to represent the result hash of a Location search.
  
  #TODO: very similar to concert_setlist_result, event_result, and artist_result, extract common stuff to module/superclass
  class LocationResult
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
        if results.include?("location")
          results["location"].each do |location|
            locations << Songkickr::Location.new(location)
          end
        end
        
        locations
      end
  end
end
