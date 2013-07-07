require 'helper'

class TestMetroArea < Test::Unit::TestCase
  context "Given an MetroArea from fixture" do
    setup do
      @metro_area = Songkickr::MetroArea.new(fixture_hash('metro_area.json')["metroArea"])
    end

    should "properly load data from JSON" do
      assert_equal "Twin Cities", @metro_area.display_name
      assert_equal 35130, @metro_area.id
      assert_equal "http://www.songkick.com/metro_areas/35130-us-twin-cities?utm_source=4791&utm_medium=partner", @metro_area.uri
      assert_equal "MN", @metro_area.state
      assert_equal "US", @metro_area.country
    end
  end
end
