module Songkickr
  class ResultSet
    attr_accessor :page, :per_page, :total_entries, :results, :result_type, :result_key_string, :status

    def initialize(result_hash = {})
      results_page = result_hash["resultsPage"]

      if results_page
        @status        = results_page["status"]                if results_page.include? "status"
        @page          = results_page["page"]                  if results_page.include? "page"
        @per_page      = results_page["per_page"]              if results_page.include? "per_page"
        @total_entries = results_page["totalEntries"]          if results_page.include? "totalEntries"
        @results       = parse_results results_page["results"] if results_page.include? "results"
      end
    end

    protected

      def parse_results(results = {})
        return [] unless results.include? result_key_string
        results[result_key_string].inject([]) do |result_items, result_item|
          result_items << eval("Songkickr::#{result_type}.new(#{result_item})")
        end
      end
  end
end
