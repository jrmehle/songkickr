module Songkickr
  class Result
    attr_accessor :page, :total_entries, :results
    
    def initialize(result_hash)
      results_page = result_hash["resultsPage"]
      
      @page          = results_page["page"]
      @total_entries = results_page["totalEntries"]
      @results       = parse_results results_page["results"]
    end
    
    
    protected
    
      def parse_results(results)
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
