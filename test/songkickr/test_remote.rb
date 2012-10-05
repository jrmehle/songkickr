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


  end


  def api_key
    'hFYxiInE4DBpH5KL'
  end

end
