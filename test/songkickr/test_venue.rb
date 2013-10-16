require 'helper'

class TestVenue < Test::Unit::TestCase
  context "Given an Venue from fixture" do
    setup do
      @venue = Songkickr::Venue.new(fixture_hash('venue_1276231.json')["resultsPage"]["results"]["venue"])
    end

    should "properly load data from JSON" do
      assert_equal "Branch House Amphitheater", @venue.display_name
      assert_equal 1276231, @venue.id
      assert_equal 38.558191, @venue.lat
      assert_equal -122.584747, @venue.lng
      assert_not_nil @venue.metro_area
    end
  end
end
