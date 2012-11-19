require 'helper'

class TestLocation < Test::Unit::TestCase
  context "Given Locations from fixture" do
    setup do
      @locations = Songkickr::LocationResult.new(fixture_hash('locations_bar.json'))
    end

    should "properly load data from JSON" do
      assert_equal 8, @locations.results.size
      assert_equal 8, @locations.total_entries
      
      potters_bar = @locations.results.first
      assert_equal "Potters Bar", potters_bar.city
      assert_equal 51.6833, potters_bar.lat
      assert_equal -0.166667, potters_bar.lng 
      assert_equal 24426, potters_bar.metro_area["id"]
    end
    
  end  
end
