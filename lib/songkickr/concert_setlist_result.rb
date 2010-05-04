module Songkickr
  class ConcertSetlistResult
    attr_accessor :results
    
    def initialize(result_hash = {})
      
      if result_hash["resultsPage"]
        results_page = result_hash["resultsPage"]
      
        if results_page
          @results = parse_results results_page["results"]
        end
      else
        result_hash
      end
    end
    
    
    protected
    
      def parse_results(results = {})
        setlists = []
        if results.include?("setlist")
          results["setlist"].each do |setlist|
            setlists << Songkickr::Setlist.new(setlist)
          end
        end
        
        setlists
      end
  end
end
