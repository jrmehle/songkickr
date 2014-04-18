require 'helper'
require 'vcr_helper'

class TestRemote < Test::Unit::TestCase
  context "Given a remote with no api key" do
    should "raise an APIKeyNotSet exception when created with no key" do
      assert_raise APIKeyNotSet do
        @remote = Songkickr::Remote.new
      end
    end
  end

  context "Given an invalid Resource" do
    setup do
      @remote = Songkickr::Remote.new api_key
    end

    should "raise a ResourceNotFound exception when search a songkick artist id doesn't exist" do
      VCR.use_cassette('invalid_artist_id') do
        assert_raise ResourceNotFound do
          @remote.artist(123123123123123123123123)
        end
      end
    end

    should "raise a ResourceNotFound exception when search a songkick event id doesn't exist" do
      VCR.use_cassette('invalid_event_id') do
        assert_raise ResourceNotFound do
          @remote.event(123123123123123123123123)
        end
      end
    end

    should "raise an ResourceNotFound exception when search a songkick venue id doesn't exist" do
      VCR.use_cassette('invalid_venue_id') do
        assert_raise ResourceNotFound do
          @remote.venue(123123123123123123123123)
        end
      end
    end

    should "raise an ResourceNotFound exception when search a user doesn't exist" do
      VCR.use_cassette('invalid_user') do
        assert_raise ResourceNotFound do
          @remote.users_tracked_artists("fffffffbbbbbbbbaaaarrrrrrrr")
        end
      end
    end

  end

  context "Given a remote with an invalid api key" do
    setup do
      @remote = Songkickr::Remote.new 'omgwtfbbq_fake_key'
    end

    should "generate a remote" do
      assert_not_nil @remote
    end

    should "raise an API Error when the API key is wrong" do
      VCR.use_cassette('invalid_api_key') do
        assert_raise APIError do
          @remote.event(17522)
        end
      end
    end

  end


  context "Given a valid resource" do
    setup do
      @remote = Songkickr::Remote.new api_key
    end

    should "return the correct artist for an existing artist id " do
      VCR.use_cassette('valid_artist') do
        result = @remote.artist(253846)
        assert_equal 253846, result.id
      end
    end

    should "return the correct event for an existing event id " do
      VCR.use_cassette('valid_event') do
        result = @remote.event(17522)
        assert_equal 17522, result.id
      end
    end


    should "return the correct venue for a given venue id " do
      VCR.use_cassette('valid_venue') do
        result = @remote.venue(17522)
        assert_equal 17522, result.id
      end
    end

    should "return the correct tracked artists for an existing user" do
      VCR.use_cassette('valid_user') do
        result = @remote.users_tracked_artists("nigelpurves")
        assert_equal "2:54", result.results.first.display_name
      end
    end

    should "return the correct similar artists for artist" do
      VCR.use_cassette('similar_artists') do
        result = @remote.similar_artists(521019)
        assert_equal "Godsmack", result.results.first.display_name
      end
    end

    should "return the correct venue calendar" do
      VCR.use_cassette('venue_calendar') do
        result = @remote.venue_calendar(1054)
        assert_equal "Big Time Rush with Victoria Justice and Big Time Rush Premium Seats at Target Center (August 10, 2013)", result.results.first.display_name
      end
    end

    should "return the correct setlists for a concert" do
      VCR.use_cassette('concert_setlists') do
        result = @remote.concert_setlists(786417)
        assert_equal "Wilco at Troxy (25 Aug 09)", result.results.first.display_name
      end
    end

    should "return the events for an artist" do
      VCR.use_cassette('artist_events') do
        result = @remote.artist_events(109675)
        assert_equal "Senses Fail at The Zoo (August 7, 2013)", result.results.first.display_name
      end
    end

    should "return the artist when searched as a string" do
      VCR.use_cassette('artist_search_string') do
        result = @remote.artist_search('Counterparts')
        assert_equal "Counterparts", result.results.first.display_name
      end
    end

    should "return the artist with paged results when searched as a hash" do
      VCR.use_cassette('paged_artist_search') do
        result = @remote.artist_search(:artist_name => 'Counterparts', :per_page => 2)
        assert_equal 2, result.results.size
      end
    end

    should "return the artist when searched as a hash" do
      VCR.use_cassette('artist_search_hash') do
        result = @remote.artist_search(:artist_name => 'Counterparts')
        assert_equal "Counterparts", result.results.first.display_name
      end
    end

    should "return the event when searched" do
      VCR.use_cassette('event_search') do
        result = @remote.events(:artist_name => 'Counterparts')
        assert_equal "Sound and Fury 2013", result.results.first.display_name
      end
    end

    should "return the location when searched" do
      VCR.use_cassette('location_search') do
        result = @remote.location_search(:query => 'St. Paul, MN')
        assert_equal "St. Paul", result.results.first.city
        assert_equal Songkickr::MetroArea, result.results.first.metro_area.class
      end
    end

    should "return the metro area events when searched" do
      VCR.use_cassette('metro_areas_events') do
        result = @remote.metro_areas_events(35130)
        assert_equal "Duluth Waterfront/Bayfront Festival Park 2013", result.results.first.display_name
      end
    end

    should "return the venue calendar for id" do
      VCR.use_cassette('venue_calendar') do
        result = @remote.venue_calendar(624)
        assert_equal "Mumford & Sons with The Vaccines and Bear's Den at Xcel Energy Center (September 4, 2013)", result.results.first.display_name
      end
    end

    should "return the search venue" do
      VCR.use_cassette('venue_search') do
        result = @remote.venue_search('Xcel Energy Center')
        assert_equal "Xcel Energy Center", result.results.first.display_name
      end
    end

    should "return the users tracked metro areas" do
      VCR.use_cassette('users_tracked_metro_areas') do
        result = @remote.users_tracked_metro_areas('jrmehle')
        assert_equal "Twin Cities", result.results.first.display_name
      end
    end

    should "return the users metro area trackings" do
      VCR.use_cassette('users_metro_area_tracking') do
        result = @remote.users_metro_area_tracking('jrmehle', 35130)
        assert_equal [], result.results
      end
    end

    should "return the users tracked artists" do
      VCR.use_cassette('users_tracked_artists') do
        result = @remote.users_tracked_artists('jrmehle')
        assert_equal "3 Inches of Blood", result.results.first.display_name
      end
    end

    should "return the users artist tracking" do
      VCR.use_cassette('users_artist_tracking') do
        result = @remote.users_artist_tracking('jrmehle', 231185)
        assert_equal [], result.results
      end
    end

    should "return the users muted artists" do
      VCR.use_cassette('users_muted_artists') do
        result = @remote.users_muted_artists('jrmehle')
        assert_equal "311", result.results.first.display_name
      end
    end

    should "return the searched user events" do
      VCR.use_cassette('users_events') do
        result = @remote.users_events('michelle')
        assert_equal "Wilderness festival 2013", result.results.first.display_name
      end
    end

    should "return the users attendance" do
      VCR.use_cassette('users_attendance') do
        result = @remote.users_attendance('michelle', 15789464)
        assert_equal "event:15789464", result.results.id
        assert_equal "im_going", result.results.attendance
      end
    end

    should "return the artists gigography" do
      VCR.use_cassette('artists_gigography') do
        result = @remote.artists_gigography(253846)
        assert_equal "Radiohead at The Holly Bush Inn (July 22, 1991)", result.results.first.display_name
      end
    end

    should "return the users gigography" do
      VCR.use_cassette('users_gigography') do
        result = @remote.users_gigography('michelle')
        assert_equal "Deltron 3030 at Irving Plaza (November 6, 2000)", result.results.first.display_name
      end
    end

    should "return the users tracked events calendar" do
      VCR.use_cassette('users_tracked_events_calendar') do
        result = @remote.users_tracked_events_calendar('jrmehle')
        assert_equal 1, result.results.first.reason.count
        assert_equal Songkickr::Artist, result.results.first.reason.first.class
      end
    end

    should "return the users attendance calendar" do
      VCR.use_cassette('users_attendance_calendar') do
        result = @remote.users_attendance_calendar('jrmehle')
        assert_equal "i_might_go", result.results.first.reason
      end
    end
  end

  def api_key
    'hFYxiInE4DBpH5KL'
  end
end
