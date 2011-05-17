require 'helper'

class TestArtist < Test::Unit::TestCase
  context "Given an Event from fixture" do
    setup do
      @event = Songkickr::Event.new(fixture_hash('event_7391451.json')["resultsPage"]["results"]["event"])
    end

    should "properly load data from JSON" do
      assert_equal "Concert", @event.type
      assert_equal "Munich, Germany", @event.location.city
      assert_equal "Muffathalle", @event.venue.display_name
      assert_equal 1, @event.performance.size
      assert_equal "17 Hippies", @event.performance.first.display_name 
    end
    
  end  
end
