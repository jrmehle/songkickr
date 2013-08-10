require 'helper'

class TestCalendarEntry < Test::Unit::TestCase
  context "Given a CalendarEntry from fixture" do
    setup do
      @calendar_entry = Songkickr::CalendarEntry.new fixture_hash('users_attendance_calendar.json')["resultsPage"]["results"]["calendarEntry"][0]
    end

    should "properly load data from JSON" do
      assert_equal "2013-07-28T07:08:44+0100", @calendar_entry.created_at
      assert_equal Songkickr::Event, @calendar_entry.event.class
      assert_equal "i_might_go", @calendar_entry.reason
    end
  end
end
