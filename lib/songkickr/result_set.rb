module Songkickr
  class ResultSet
    attr_accessor :page, :total_entries, :results, :result_type, :result_key_string

    def initialize(result_hash = {})
      # @result_type = "Event" or "MetroArea"
      results_page = result_hash["resultsPage"]

      if results_page
        @page          = results_page["page"]                  if results_page.include? "page"
        @total_entries = results_page["totalEntries"]          if results_page.include? "totalEntries"
        @results       = parse_results results_page["results"] if results_page.include? "results"
      end
    end

    protected

      def parse_results(results = {})
        result_items = []
        if results.include? result_key_string
          results[result_key_string].each do |result_item|
            result_items << eval("Songkickr::#{result_type}.new(#{result_item})")
          end
        end

        result_items
      end
  end
end
