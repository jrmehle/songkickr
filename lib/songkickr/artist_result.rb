module Songkickr
  class ArtistResult
  	attr_accessor :page, :total_entries, :results

  	def initialize(result_hash = {})
  		results_page = result_hash["resultsPage"]

  		if results_page
  			@page 			= results_page["page"]
  			@total_entries	= results_page["totalEntries"]
  			@results 		= parse_results results_page["results"]
  		end
  	end

  	protected

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