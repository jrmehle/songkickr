require 'helper'
require 'pry'

class TestLocation < Test::Unit::TestCase
  context "Given Locations from fixture" do
    setup do
      @locations = Songkickr::LocationResult.new(fixture_hash('location_search.json'))
    end

    should "properly load data from JSON" do
      assert_equal 1, @locations.results.size
      assert_equal 1, @locations.total_entries

      twin_cities = @locations.results.first
      assert_equal "Twin Cities", twin_cities.city
      assert_equal 44.9801, twin_cities.lat
      assert_equal -93.2519, twin_cities.lng
      assert_equal 35130, twin_cities.metro_area.id
    end
  end
end
