module Songkickr
  class ConcertSetlistResult
    attr_accessor :page, :total_entries, :results
    
    def initialize(result_hash = {})
      
      if result_hash["resultsPage"]
        results_page = result_hash["resultsPage"]
      
        if results_page
          @page          = results_page["page"]
          @total_entries = results_page["totalEntries"]
          @results       = parse_results results_page["results"]
        end
      else
        result_hash
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
