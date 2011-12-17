module Songkickr
  # A class to represent the result hash of an Setlist search.
  #
  # http://www.songkick.com/developer/setlists
  class ConcertSetlistResult
    attr_accessor :results

    # Takes the result ash and passes it to parse_results
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

      # Parses the setlist items into an array of SetlistItems
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
