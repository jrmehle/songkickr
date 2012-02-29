require 'helper'

class TestVenue < Test::Unit::TestCase
  context "Given an Venue from fixture" do
    setup do
      @event = Songkickr::Venue.new(fixture_hash('venue_1276231.json')["resultsPage"]["results"]["venue"])
    end

    should "properly load data from JSON" do
      assert_equal "Branch House Amphitheater", @event.display_name
      assert_equal 1276231, @event.id
      assert_equal 38.558191, @event.lat
      assert_equal -122.584747, @event.lng
    end

  end
end