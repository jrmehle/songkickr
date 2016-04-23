require 'helper'

class TestArtist < Test::Unit::TestCase
  context "Given a new Artist" do
    setup do
      @uri          = 'http://jrmehle.com/'
      @display_name = 'Artist Name'
      @artist       = Songkickr::Artist.new({'uri' => @uri, 'displayName' => @display_name})
    end

    should "init uri" do
      assert_not_nil @artist
      assert_equal @uri, @artist.uri
    end

    should "init display_name" do
      assert_not_nil @artist
      assert_equal @display_name, @artist.display_name
    end
  end
end
