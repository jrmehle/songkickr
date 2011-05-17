module Songkickr
  class LocationResult
    # TODO: very similar to event_result and artist_result,
    # extract common stuff to module/superclass
    attr_accessor :page, :total_entries, :results
    
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
