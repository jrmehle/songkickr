module Songkickr
  # A class to represent the result hash of an Artist search.
  class ArtistResult
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

    # Take the results hash directly and parse the artists into Artist objects.
    #
    # Returns an array of Artists.
    def parse_results(results = {})
      artists = []
      if results.include?("artist")
        results["artist"].each do |artist|
          artists << Songkickr::Artist.new(artist)
        end
      end
      artists
    end
  end
end
