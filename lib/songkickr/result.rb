module Songkickr
  class Result
    attr_accessor :page, :total_entries, :results
    
    def initialize(result_hash)
      @page          = result_hash[:page]
      @total_entries = result_hash[:total_entries]
      @results       = result_hash[:results]
    end
    
  end
end
