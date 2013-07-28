require 'helper'

class TestEvent < Test::Unit::TestCase
  context "Given an Event from fixture" do
    setup do
      @event = Songkickr::Event.new(fixture_hash('event_7391451.json')["resultsPage"]["results"]["event"][0])
    end

    should "properly load data from JSON" do
      assert_equal "Festival", @event.type
      assert_equal "Santa Barbara, CA, US", @event.location.city
      assert_equal "Earl Warren Showgrounds", @event.venue.display_name
      assert_equal 27, @event.performances.size
      assert_equal "The Ghost Inside", @event.performances.first.display_name
    end
  end
end
