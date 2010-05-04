require 'helper'

class TestArtist < Test::Unit::TestCase
  context "Given a new Artist" do
    setup do
      @href = 'http://jrmehle.com/'
      @display_name = 'Artist Name'
      @artist = Songkickr::Artist.new({'href' => @href, 'displayName' => @display_name})
    end

    should "init href" do
      assert_not_nil @artist
      assert_equal @href, @artist.href
    end
    
    should "init display_name" do
      assert_not_nil @artist
      assert_equal @display_name, @artist.display_name
    end
  end  
end
